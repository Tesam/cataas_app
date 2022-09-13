import 'dart:typed_data';

import 'package:cataas_app/data/datasources/remote/cat_service.dart';
import 'package:cataas_app/domain/repositories/cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  const CatRepositoryImpl(this._catService);

  final CatService _catService;

  @override
  Future<Uint8List?> getCat() => _catService.getCat();

}