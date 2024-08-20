import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubKategori {
  String categoryID;
  String subCatID;
  String materialID;
  String subCategoryName;

  SubKategori(
      {required this.categoryID,
      required this.subCatID,
      required this.materialID,
      required this.subCategoryName});
}

class SubKategoriProvider extends ChangeNotifier {
  List<SubKategori> _subCategories = [];

  List<SubKategori> get subCategories => _subCategories;

  Future fetchSubKategoriData() async {
    print('running fetchSubKategoriData');
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/material?query=');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final subCategories = (jsonData['data'] as List)
          .map((item) => SubKategori(
                categoryID: item['category_id'],
                subCatID: item['subcat_id'],
                materialID: item['material_id'],
                subCategoryName: item['material_name'],
              ))
          .toList();
      _subCategories = subCategories;
    } else {
      throw Exception('Failed to load sub-kategori');
    }
    notifyListeners();
  }
}
