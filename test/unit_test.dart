import 'dart:typed_data';

import 'package:cataas_app/core/params/get_cat_params.dart';
import 'package:cataas_app/data/datasources/remote/cat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Cat image should not be null with empty parameters', () {
    final http.Client client = http.Client();
    final CatService catService = CatService(client);
    final GetCatParams getCatParams = GetCatParams(filter: "", text: "");

    final Future<Uint8List?> cat = catService.getCat(getCatParams);

    expect(cat, completion(isNotNull));
  });
}