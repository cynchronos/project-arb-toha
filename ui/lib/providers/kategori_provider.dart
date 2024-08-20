import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kategori {
  String categoryName;
  String categoryID;
  Kategori({required this.categoryName, required this.categoryID});
}

class KategoriProvider extends ChangeNotifier {
  List<Kategori> _categories = [];

  List<Kategori> get categories => _categories;

  Future fetchKategoriData() async {
    print('running fetchKategoriData');
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/kategori?query=');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      final categories = (jsonData['data'] as List)
          .map((item) => Kategori(
                categoryID: item['category_id'],
                categoryName: item['category_name'],
              ))
          .toList();
      _categories = categories;
    } else {
      throw Exception('Failed to load kategori');
    }
    notifyListeners();
  }
}
