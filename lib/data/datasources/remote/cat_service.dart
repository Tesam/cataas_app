import 'dart:typed_data';

class CatService {
  CatService(this._client);
  final _client;

  Future<Uint8List?> getCat() async{
    var response = await _client.get(Uri.parse('https://cataas.com/cat/gif'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }else{
      return null;
    }
  }
}