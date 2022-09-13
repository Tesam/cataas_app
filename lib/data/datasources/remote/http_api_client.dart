import 'package:cataas_app/data/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class HttpApiClient {
  const HttpApiClient();

  Future<http.Response> get({required String endpoint}) async {
    final Uri uri = Uri.parse('$apiUrl$endpoint');
    return await http.get(uri);
  }
}