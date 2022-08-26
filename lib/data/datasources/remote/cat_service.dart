import 'dart:typed_data';
import 'package:cataas_app/core/params/get_cat_params.dart';
import 'package:cataas_app/data/constants/api_constants.dart';

class CatService {
  CatService(this._client);
  final _client;

  Future<Uint8List?> getCat(GetCatParams params) async{
    print("$apiUrl/says/${params.text}?filter=${params.filter}");
    var response = await _client.get(Uri.parse("$apiUrl/says/${params.text}?filter=${params.filter}"));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}