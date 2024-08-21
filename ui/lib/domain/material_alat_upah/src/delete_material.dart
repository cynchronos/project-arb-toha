import 'package:http/http.dart' as http;

Future deleteMaterial(material) async {
  // print('running deleteMaterialData');
  // print(material);
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/$material');

  final response = await http.delete(url);

  if (response.statusCode == 200) {
    print('Material Deleted successfully');
  }

  print(response.body);
}
