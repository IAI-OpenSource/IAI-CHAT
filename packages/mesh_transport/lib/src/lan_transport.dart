import 'dart:async';
import 'dart:typed_data';

import 'package:core_protocol/core_protocol.dart';

import 'mesh_transport.dart';

/// In-process / same-isolate LAN mock for UI + crypto development.
///
/// Multiple [LanTransport] instances that share a [LanHub] can exchange
/// packets without Bluetooth. Replace later with sockets / mDNS.
class LanHub {
  final _buses = <PeerId, StreamController<Packet>>{};

  void register(PeerId id, StreamController<Packet> controller) {
    _buses[id] = controller;
  }

  void unregister(PeerId id) {
    _buses.remove(id);
  }

  Set<PeerId> get peers => _buses.keys.toSet();

  void deliver(Packet packet) {
    final to = packet.recipientId;
    if (to == null) {
      for (final entry in _buses.entries) {
        if (entry.key != packet.senderId) {
          entry.value.add(packet);
        }
      }
      return;
    }
    _buses[to]?.add(packet);
  }
}

class LanTransport implements MeshTransport {
  LanTransport({
    required this.localId,
    required LanHub hub,
  }) : _hub = hub;

  @override
  final PeerId localId;

  final LanHub _hub;
  final _incoming = StreamController<Packet>.broadcast();
  final _peers = StreamController<Set<PeerId>>.broadcast();
  var _started = false;

  @override
  Stream<Packet> get incoming => _incoming.stream;

  @override
  Stream<Set<PeerId>> get peers => _peers.stream;

  @override
  Future<void> start() async {
    if (_started) return;
    _started = true;
    _hub.register(localId, _incoming);
    _peers.add(_hub.peers);
  }

  @override
  Future<void> stop() async {
    _hub.unregister(localId);
    _started = false;
    await _incoming.close();
    await _peers.close();
  }

  @override
  Future<void> send(Packet packet) async {
    if (!_started) {
      throw StateError('LanTransport not started');
    }
    _hub.deliver(packet);
    _peers.add(_hub.peers);
  }
}

/// Helper to build a demo peer id from a small integer.
PeerId demoPeerId(int n) =>
    PeerId(Uint8List.fromList(List<int>.generate(8, (i) => (n + i) & 0xff)));
