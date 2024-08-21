import 'dart:convert';
import 'package:http/http.dart' as http;

class Materialitem {
  String categoryID;
  String categoryName;
  String subcatID;
  String subCatName;
  String materialID;
  String materialName;

  Materialitem(
      {required this.categoryID,
      required this.categoryName,
      required this.subcatID,
      required this.subCatName,
      required this.materialID,
      required this.materialName});
}

Future getMaterials() async {
  print('running getMaterials');

  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/material?query=');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData == []) {
      return '';
    }
    final result = (jsonData['data'] as List)
        .map((item) => Materialitem(
              categoryID: item['category_id'],
              categoryName: item['category_name'],
              subcatID: item['subcat_id'],
              subCatName: item['subcat_name'],
              materialID: item['material_id'],
              materialName: item['material_name'],
            ))
        .toList();
    return result;
  } else {
    throw Exception('Failed to load materials');
  }
}
