import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataApi {
  static Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/phpcrud/EndPoint.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
