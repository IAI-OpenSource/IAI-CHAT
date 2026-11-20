import 'dart:typed_data';

import 'key_pair.dart';

/// Crypto API consumed by protocol + UI layers.
///
/// Week-1 contract: keep this interface stable; fill the body with a real
/// library behind the scenes.
abstract class CryptoEngine {
  /// Creates a fresh long-term identity.
  Future<IdentityKeyPair> generateIdentity();

  /// Short fingerprint for face-to-face / QR verification.
  String fingerprint(Uint8List publicKey);

  /// Encrypts [plaintext] for [recipientPublicKey].
  Future<Uint8List> encrypt({
    required Uint8List plaintext,
    required Uint8List recipientPublicKey,
    required IdentityKeyPair sender,
  });

  /// Decrypts [ciphertext] from [senderPublicKey].
  Future<Uint8List> decrypt({
    required Uint8List ciphertext,
    required Uint8List senderPublicKey,
    required IdentityKeyPair recipient,
  });

  /// Signs [data] with the local identity.
  Future<Uint8List> sign({
    required Uint8List data,
    required IdentityKeyPair signer,
  });

  /// Verifies [signature] for [data] against [publicKey].
  Future<bool> verify({
    required Uint8List data,
    required Uint8List signature,
    required Uint8List publicKey,
  });
}

/// Placeholder so the repo compiles before the crypto team lands a real impl.
class UnimplementedCryptoEngine implements CryptoEngine {
  @override
  Future<IdentityKeyPair> generateIdentity() =>
      throw UnimplementedError('Crypto team: wire libsodium / cryptography');

  @override
  String fingerprint(Uint8List publicKey) =>
      throw UnimplementedError('Crypto team: wire fingerprint');

  @override
  Future<Uint8List> encrypt({
    required Uint8List plaintext,
    required Uint8List recipientPublicKey,
    required IdentityKeyPair sender,
  }) =>
      throw UnimplementedError('Crypto team: wire encrypt');

  @override
  Future<Uint8List> decrypt({
    required Uint8List ciphertext,
    required Uint8List senderPublicKey,
    required IdentityKeyPair recipient,
  }) =>
      throw UnimplementedError('Crypto team: wire decrypt');

  @override
  Future<Uint8List> sign({
    required Uint8List data,
    required IdentityKeyPair signer,
  }) =>
      throw UnimplementedError('Crypto team: wire sign');

  @override
  Future<bool> verify({
    required Uint8List data,
    required Uint8List signature,
    required Uint8List publicKey,
  }) =>
      throw UnimplementedError('Crypto team: wire verify');
}
