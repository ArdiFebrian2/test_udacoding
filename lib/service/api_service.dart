import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost/beckend/api.php';

  static Future<http.Response> post(
      String endpoint, Map<String, dynamic> body) {
    return http.post(Uri.parse('$baseUrl$endpoint'), body: body);
  }

  static Future<http.Response> get(String endpoint) {
    return http.get(Uri.parse('$baseUrl$endpoint'));
  }
}
