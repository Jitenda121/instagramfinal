abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(
    String url,
  );
   Future<dynamic> getApiResponse(String url, Map<String, String> header);
  Future<dynamic> getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header});
  Future<dynamic> getDeleteApiResponse(String url,
      {Map<String, String>? header});
       Future<dynamic> getPatchApiResponse(String url, dynamic data,
      {Map<String, String>? header});
      //  Future<dynamic> reportPost(String url, Map<String, dynamic> data,
      // {Map<String, String>? header});
}
