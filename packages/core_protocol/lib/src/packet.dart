import 'dart:convert';
import 'dart:typed_data';

import 'message_type.dart';
import 'peer_id.dart';

/// Wire-level unit exchanged between peers.
///
/// Serialization starts as JSON for speed of iteration; the protocol team
/// can switch to a compact binary format without changing the public fields.
class Packet {
  const Packet({
    required this.version,
    required this.type,
    required this.senderId,
    required this.recipientId,
    required this.seq,
    required this.ttl,
    required this.payload,
    this.signature = const [],
  });

  final int version;
  final MessageType type;
  final PeerId senderId;
  final PeerId? recipientId;
  final int seq;
  final int ttl;
  final Uint8List payload;
  final List<int> signature;

  Map<String, Object?> toJson() => {
        'v': version,
        'type': type.code,
        'from': senderId.toHex(),
        'to': recipientId?.toHex(),
        'seq': seq,
        'ttl': ttl,
        'payload': base64Encode(payload),
        'sig': base64Encode(signature),
      };

  static Packet fromJson(Map<String, Object?> json) {
    final to = json['to'] as String?;
    return Packet(
      version: json['v'] as int,
      type: MessageType.fromCode(json['type'] as int),
      senderId: PeerId(_hexToBytes(json['from'] as String)),
      recipientId: to == null ? null : PeerId(_hexToBytes(to)),
      seq: json['seq'] as int,
      ttl: json['ttl'] as int,
      payload: Uint8List.fromList(base64Decode(json['payload'] as String)),
      signature: base64Decode(json['sig'] as String? ?? ''),
    );
  }

  String encode() => jsonEncode(toJson());

  static Packet decode(String raw) =>
      fromJson(jsonDecode(raw) as Map<String, Object?>);

  static Uint8List _hexToBytes(String hex) {
    final out = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < out.length; i++) {
      out[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return out;
  }
}
