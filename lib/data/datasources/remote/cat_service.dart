import 'dart:typed_data';
import 'package:cataas_app/data/constants/api_constants.dart';

class CatService {
  CatService(this._client);
  final _client;

  Future<Uint8List?> getCat() async{
    var response = await _client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}