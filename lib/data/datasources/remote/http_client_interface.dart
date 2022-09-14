abstract class IHttpClient<T> {
  Future<T> get({required String endpoint});
}