import 'dart:typed_data';

import 'package:cataas_app/core/params/get_cat_params.dart';
import 'package:cataas_app/domain/repositories/cat_repository.dart';

class GetCat{
  const GetCat(this._catRepository, {required this.getCatParams});

  final CatRepository _catRepository;
  final GetCatParams getCatParams;

  Future<Uint8List?> getCat() =>  _catRepository.getCat(getCatParams);
}