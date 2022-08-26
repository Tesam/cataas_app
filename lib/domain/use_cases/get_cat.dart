import 'dart:typed_data';

import 'package:cataas_app/domain/repositories/cat_repository.dart';

class GetCat{
  const GetCat(this._catRepository);

  final CatRepository _catRepository;

  Future<Uint8List?> getCat() =>  _catRepository.getCat();
}