import 'dart:convert';
import 'package:http/http.dart' as http;

Future editMaterial(listID, materialID, satuan, harga, area, keterangan) async {
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/$listID');
  final response = await http.put(url,
      headers: {'content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'material_id': materialID,
        'satuan': satuan,
        'harga': harga,
        'area': area,
        'bulan_tahun': keterangan
      }));

  if (response.statusCode == 200) {
    print('Material edited successfully');
  }
  print(response.body);
}
