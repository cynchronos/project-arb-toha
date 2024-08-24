import 'package:http/http.dart' as http;
import 'dart:convert';

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

Future getDaftarMaterial() async {
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
    return result;
  } else {
    throw Exception('Failed to load daftar material');
  }
}
