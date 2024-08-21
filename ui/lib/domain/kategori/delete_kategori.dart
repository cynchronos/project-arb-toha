import 'package:http/http.dart' as http;

Future deleteKategori(categoryName) async {
  print('running deleteKategori');
  print(categoryName);
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/kategori/$categoryName');

  final response = await http.delete(url);

  if (response.statusCode == 200) {
    print('Kategori Deleted successfully');
  }

  print(response.body);
}
