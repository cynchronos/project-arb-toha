import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchMaterialdata() async {
  var arrays = [];
  final url =
      Uri.parse('http://127.0.0.1:3000/api/material-alat-dan-upah/kategori');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final categories = data['data'] as List<dynamic>;

    for (final category in categories) {
      final item = category;
      arrays.add(item);
    }
  } else {
    throw Exception('Failed to load album');
  }
  return arrays;
}
