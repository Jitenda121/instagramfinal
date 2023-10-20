abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(
    String url,
  );
  //Future<dynamic> getPostApiResponse1(String url,dynamic data,);

  Future<dynamic> getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header}
      );
}
