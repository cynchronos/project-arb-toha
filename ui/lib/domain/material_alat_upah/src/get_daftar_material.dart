import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ui/providers/material_provider.dart';

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
