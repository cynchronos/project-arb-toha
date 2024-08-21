import 'dart:convert';
import 'package:http/http.dart' as http;

Future addSubcat(categoryID,subcatName) async {
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/kategori/');
  final response = await http.post(url,
      headers: {'content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'category_id': categoryID,
        'subcat_name' : subcatName
      }));

  if (response.statusCode == 200) {
    print('subcategory added successfully');
  }
  print(response.body);
}
