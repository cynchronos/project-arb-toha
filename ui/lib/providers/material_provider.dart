import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Material {
  String number;
  String kategori;
  String satuan;
  String harga;
  String area;
  String keterangan;

  Material(
      {required this.number,
      required this.kategori,
      required this.satuan,
      required this.harga,
      required this.area,
      required this.keterangan});
}

class MaterialProvider extends ChangeNotifier {
  List<Material> _materials = [];

  List<Material> get materials => _materials;

  Future fetchMaterialdata() async {
    print('hello there');
    final url =
        Uri.parse('http://127.0.0.1:3000/api/material-alat-dan-upah/kategori');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final materials = (jsonData['data'] as List)
          .map((item) => Material(
                number: item['category_id'],
                kategori: item['category_id'],
                satuan: item['category_id'],
                harga: item['category_id'],
                area: item['category_id'],
                keterangan: item['category_id'],
              ))
          .toList();
      _materials = materials;
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }
}
