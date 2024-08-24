import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DaftarMaterial {
  String listID;
  String materialName;
  String categoryName;
  String materialID;
  String satuan;
  String harga;
  String area;
  String keterangan;

  DaftarMaterial(
      {required this.listID,
      required this.materialName,
      required this.categoryName,
      required this.materialID,
      required this.satuan,
      required this.harga,
      required this.area,
      required this.keterangan});
}

class Material {
  String categoryID;
  String categoryName;
  String subcatID;
  String subCatName;
  String materialID;
  String materialName;

  Material(
      {required this.categoryID,
      required this.categoryName,
      required this.subcatID,
      required this.subCatName,
      required this.materialID,
      required this.materialName});
}

class MaterialProvider extends ChangeNotifier {
  List<DaftarMaterial> _daftarMaterials = [];
  List<DaftarMaterial> get daftarMaterials => _daftarMaterials;

  List<Material> _material = [];
  List<Material> get material => _material;

  var materialDeleteTarget = '';
  var materialEditTarget = '';
  var materialIDState = '';

  Future getDaftarMaterialForTable() async {
    print('running getDaftarMaterials');
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material?query=');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("from getDaftarMaterial: success");
      final jsonData = json.decode(response.body);
      final result = (jsonData['data'] as List)
          .map((item) => DaftarMaterial(
                listID: item['list_id'],
                materialID: item['material_id'],
                materialName: item['material_name'],
                categoryName: item['category_name'],
                satuan: item['subcat_id'],
                harga: item['harga'].toString(),
                area: item['area'],
                keterangan: item['bulan_tahun'],
              ))
          .toList();
      print(result);
      print(result);
      _daftarMaterials = result;
    } else {
      throw Exception('Failed to load daftar material');
    }
    notifyListeners();
  }

  Future getMaterials() async {
    print('running getMaterials');

    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/material?query=');

    final response = await http.get(url);

    print(response);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = (jsonData['data'] as List)
          .map((item) => Material(
                categoryID: item['category_id'],
                categoryName: item['category_name'],
                subcatID: item['subcat_id'],
                subCatName: item['subcat_name'],
                materialID: item['material_id'],
                materialName: item['material_name'],
              ))
          .toList();
      print(result);
      _material = result;
    } else {
      throw Exception('Failed to load materials');
    }
    notifyListeners();
  }

  Future setMaterialIDState(materialID) async {
    print('running materialIDState');
    materialIDState = materialID;
  }

  Future editMaterial() async {
    print('running editMaterial');
  }

  Future deleteMaterial() async {
    print('running deleteMaterial');
  }
}
