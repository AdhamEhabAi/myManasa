
import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('هناك مشكلة ${response.statusCode}');
    }
  }

  Future<http.Response> post({required String url, required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('هناك مشكلة ${response.statusCode}');
    }
  }
}
