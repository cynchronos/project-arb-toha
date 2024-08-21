import 'package:flutter/material.dart';

class DeleteProvider extends ChangeNotifier {
  String materialTarget = '';
  String kategoriTarget = '';
  String subKategoriTarget = '';

  Future deleteMaterial(material) async {
    materialTarget = material;
    print("delete material target : $material");
    notifyListeners();
  }

  Future deleteKategori(kategori) async {
    kategoriTarget = kategori;
    print("delete kategori target : $kategori");
    notifyListeners();
  }

  Future deleteSubCat(subcat) async {
    subKategoriTarget = subcat;
    print("delete kategori target : $subcat");
    notifyListeners();
  }
}
