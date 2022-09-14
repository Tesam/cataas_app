import 'package:cataas_app/data/constants/api_constants.dart';
import 'package:cataas_app/data/datasources/remote/http_client_interface.dart';
import 'package:http/http.dart' as http;

class HttpApiClient implements IHttpClient {
  const HttpApiClient();

  @override
  Future<http.Response> get({required String endpoint}) async {
    final Uri uri = Uri.parse('$apiUrl$endpoint');
    return await http.get(uri);
  }
}