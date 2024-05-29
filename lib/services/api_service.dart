import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('${Constants.apiBaseUrl}/$endpoint');
    return await http.get(url);
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('${Constants.apiBaseUrl}/$endpoint');
    return await http.post(url, body: data);
  }

  static Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('${Constants.apiBaseUrl}/$endpoint');
    return await http.put(url, body: data);
  }

  static Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('${Constants.apiBaseUrl}/$endpoint');
    return await http.delete(url);
  }
}
