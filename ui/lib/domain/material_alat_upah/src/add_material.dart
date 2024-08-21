import 'dart:convert';
import 'package:http/http.dart' as http;

Future addMaterial(materialID, satuan, harga, area, keterangan) async {
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/');
  final response = await http.post(url,
      headers: {'content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'material_id': materialID,
        'satuan': satuan,
        'harga': harga,
        'area': area,
        'bulan_tahun': keterangan
      }));

  if (response.statusCode == 200) {
    print('Material added successfully');
  }
  print(response.body);
}
