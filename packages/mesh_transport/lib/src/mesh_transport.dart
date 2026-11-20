import 'package:core_protocol/core_protocol.dart';

/// Abstraction over how packets move between devices.
///
/// UI + crypto depend only on this interface.
/// Implementations: [LanTransport] first, then BLE / Nearby.
abstract class MeshTransport {
  /// Local peer identity announced on the mesh.
  PeerId get localId;

  /// Nearby / known peers (best-effort).
  Stream<Set<PeerId>> get peers;

  /// Incoming packets.
  Stream<Packet> get incoming;

  /// Start discovery + listening.
  Future<void> start();

  /// Stop all networking.
  Future<void> stop();

  /// Send a packet (direct or broadcast if [Packet.recipientId] is null).
  Future<void> send(Packet packet);
}
