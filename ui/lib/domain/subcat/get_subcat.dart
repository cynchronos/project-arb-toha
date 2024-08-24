import 'dart:convert';
import 'package:http/http.dart' as http;

class SubKategori {
  String subCatID;
  String subCatName;
  String categoryID;
  String categoryName;

  SubKategori(
      {required this.subCatID,
      required this.subCatName,
      required this.categoryID,
      required this.categoryName});
}

Future getSubCat() async {
  print('running getSubCat');
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/subcat?query=');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final result = (jsonData['data'] as List)
        .map((item) => SubKategori(
              subCatID: item['subcat_id'],
              subCatName: item['subcat_name'],
              categoryID: item['category_id'],
              categoryName: item['category_name'],
            ))
        .toList();
    return result;
  } else {
    throw Exception('Failed to load sub-kategori');
  }
}
