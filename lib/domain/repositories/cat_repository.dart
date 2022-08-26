import 'dart:typed_data';

import 'package:cataas_app/core/params/get_cat_params.dart';

abstract class CatRepository {
  Future<Uint8List?> getCat(GetCatParams params);
}