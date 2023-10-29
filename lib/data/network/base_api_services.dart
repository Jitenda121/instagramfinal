abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(
    String url,
  );
  Future<dynamic> getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header});
  Future<dynamic> getDeleteApiResponse(String url,
      {Map<String, String>? header});
}
