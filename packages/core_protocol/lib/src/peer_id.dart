import 'dart:typed_data';

/// Short peer identity (derived later from a public key fingerprint).
class PeerId {
  const PeerId(this.bytes);

  /// Fixed-length identity bytes (8 recommended for MVP).
  final Uint8List bytes;

  String toHex() =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  @override
  bool operator ==(Object other) =>
      other is PeerId && _bytesEqual(bytes, other.bytes);

  @override
  int get hashCode => Object.hashAll(bytes);

  @override
  String toString() => 'PeerId($toHex())';

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
