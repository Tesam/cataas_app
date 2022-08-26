import 'dart:typed_data';
import 'package:cataas_app/core/params/get_cat_params.dart';
import 'package:cataas_app/data/constants/api_constants.dart';

class CatService {
  CatService(this._client);
  final _client;

  Future<Uint8List?> getCat(GetCatParams params) async{
    final String saySection = (params.text.isNotEmpty) ? "/says/${params.text}" : "";
    final String filterSection = (params.filter.isNotEmpty) ? "?filter=${params.filter}" : "";
    print("$apiUrl$saySection$filterSection");
    var response = await _client.get(Uri.parse("$apiUrl$saySection$filterSection"));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}