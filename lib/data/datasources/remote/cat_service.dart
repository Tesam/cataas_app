import 'dart:typed_data';

import 'package:cataas_app/data/constants/api_constants.dart';
import 'package:cataas_app/data/datasources/remote/http_client_interface.dart';

class CatService {
  CatService(this._client);
  final IHttpClient _client;

  Future<Uint8List?> getCat() async{
    final response = await _client.get(endpoint: catGif);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}