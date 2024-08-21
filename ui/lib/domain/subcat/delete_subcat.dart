import 'package:http/http.dart' as http;

Future deleteSubcat(subcat) async {
  print('running deleteKategori');
  print(subcat);
  final url = Uri.parse(
      'http://127.0.0.1:3000/api/material-alat-dan-upah/subcat/$subcat');

  final response = await http.delete(url);

  if (response.statusCode == 200) {
    print('subcat Deleted successfully');
  }

  print(response.body);
}
