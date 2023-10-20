import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> makeApiRequest() async {
  final String apiUrl = "https://example.com/api/endpoint";
  final String username = "socailMedia";
  final String password = "social@123";

  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      // Request was successful, handle the response
      dynamic jsonResponse = jsonDecode(response.body);
      print("Response: $jsonResponse");
    } else {
      // Request failed with status code other than 200
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    // Handle network or API errors
    print("Error: $e");
  }
}
