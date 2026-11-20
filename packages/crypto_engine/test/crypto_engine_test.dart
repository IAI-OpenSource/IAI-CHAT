import 'package:crypto_engine/crypto_engine.dart';
import 'package:test/test.dart';

void main() {
  test('UnimplementedCryptoEngine exposes stable API', () {
    final engine = UnimplementedCryptoEngine();
    expect(engine, isA<CryptoEngine>());
  });
}
