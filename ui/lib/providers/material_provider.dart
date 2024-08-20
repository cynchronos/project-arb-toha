import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Material {
  String listID;
  String materialName;
  String satuan;
  String harga;
  String area;
  String keterangan;

  Material(
      {required this.listID,
      required this.materialName,
      required this.satuan,
      required this.harga,
      required this.area,
      required this.keterangan});
}

class MaterialProvider extends ChangeNotifier {
  List<Material> _materials = [];

  List<Material> get materials => _materials;

  Future fetchMaterialdata() async {
    print('running fetchMaterialData');
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material?query=');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final materials = (jsonData['data'] as List)
          .map((item) => Material(
                listID: item['list_id'],
                materialName: item['material_name'],
                satuan: item['subcat_id'],
                harga: item['harga'].toString(),
                area: item['area'],
                keterangan: item['bulan_tahun'],
              ))
          .toList();
      _materials = materials;
    } else {
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }
}
