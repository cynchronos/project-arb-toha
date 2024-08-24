import 'dart:convert';
import 'package:http/http.dart' as http;

Future addMaterial(id, satuan, harga, area, keterangan) async {
  print(id);
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/');
  final response = await http.post(url,
      headers: {'content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'material_id': id,
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
