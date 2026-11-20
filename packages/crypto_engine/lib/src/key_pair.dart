import 'dart:typed_data';

/// Local identity key material.
///
/// Private key bytes must never leave secure storage / this process.
class IdentityKeyPair {
  const IdentityKeyPair({
    required this.publicKey,
    required this.privateKey,
  });

  final Uint8List publicKey;
  final Uint8List privateKey;
}
