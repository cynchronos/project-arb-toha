import 'dart:convert';
import 'package:flutter/material.dart';
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

class SubKategoriProvider extends ChangeNotifier {
  List<SubKategori> _subCategories = [];

  List<SubKategori> get subCategories => _subCategories;

  Future fetchSubKategoriData() async {
    print('running fetchSubKategoriData');
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/subcat?query=');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final subCategories = (jsonData['data'] as List)
          .map((item) => SubKategori(
                subCatID: item['subcat_id'],
                subCatName: item['subcat_name'],
                categoryID: item['category_id'],
                categoryName: item['category_name'],
              ))
          .toList();
      _subCategories = subCategories;
    } else {
      throw Exception('Failed to load sub-kategori');
    }
    notifyListeners();
  }
}
