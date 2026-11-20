import 'dart:typed_data';

import 'package:core_protocol/core_protocol.dart';
import 'package:test/test.dart';

void main() {
  test('Packet round-trips through JSON', () {
    final packet = Packet(
      version: 1,
      type: MessageType.chat,
      senderId: PeerId(Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8])),
      recipientId: PeerId(Uint8List.fromList([8, 7, 6, 5, 4, 3, 2, 1])),
      seq: 42,
      ttl: 5,
      payload: Uint8List.fromList([9, 9, 9]),
      signature: [1, 2, 3],
    );

    final restored = Packet.decode(packet.encode());

    expect(restored.version, 1);
    expect(restored.type, MessageType.chat);
    expect(restored.senderId, packet.senderId);
    expect(restored.recipientId, packet.recipientId);
    expect(restored.seq, 42);
    expect(restored.ttl, 5);
    expect(restored.payload, packet.payload);
    expect(restored.signature, [1, 2, 3]);
  });
}
