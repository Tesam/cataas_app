import 'dart:typed_data';

import 'package:cataas_app/data/datasources/remote/http_api_client.dart';

class CatService {
  CatService(this._client);
  final HttpApiClient _client;

  Future<Uint8List?> getCat() async{
    final response = await _client.get(endpoint: '/cat/gif');
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}