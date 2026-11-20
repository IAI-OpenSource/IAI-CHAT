import 'package:core_protocol/core_protocol.dart';
import 'package:mesh_transport/mesh_transport.dart';
import 'package:test/test.dart';
import 'dart:typed_data';

void main() {
  test('LanTransport delivers a chat packet between two peers', () async {
    final hub = LanHub();
    final a = LanTransport(localId: demoPeerId(1), hub: hub);
    final b = LanTransport(localId: demoPeerId(2), hub: hub);

    await a.start();
    await b.start();

    final received = b.incoming.first;

    await a.send(
      Packet(
        version: 1,
        type: MessageType.chat,
        senderId: a.localId,
        recipientId: b.localId,
        seq: 1,
        ttl: 3,
        payload: Uint8List.fromList('hello'.codeUnits),
      ),
    );

    final packet = await received.timeout(const Duration(seconds: 2));
    expect(packet.type, MessageType.chat);
    expect(String.fromCharCodes(packet.payload), 'hello');

    await a.stop();
    await b.stop();
  });
}
