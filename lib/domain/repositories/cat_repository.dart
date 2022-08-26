import 'dart:typed_data';

abstract class CatRepository {
  Future<Uint8List?> getCat();
}