import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/pages/material_alat_upah/material_input_field.dart';
import 'package:http/http.dart' as http;

class SubKategoriForm extends StatefulWidget {
  SubKategoriForm({super.key});

  @override
  State<SubKategoriForm> createState() => _SubKategoriState();
}

class _SubKategoriState extends State<SubKategoriForm> {
  final _materialFormKey = GlobalKey<FormState>();

  final TextEditingController kategoriController = TextEditingController();

  final TextEditingController namaController = TextEditingController();

  final TextEditingController satuanController = TextEditingController();

  final TextEditingController hargaController = TextEditingController();

  final TextEditingController areaController = TextEditingController();

  final TextEditingController keteranganController = TextEditingController();

  Future submitMaterialForm() async {
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/');
    final response = await http.post(url,
        headers: {'content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'material_id': 'AAGF',
          'satuan': 'm3',
          'harga': 3000,
          'area': 'palu',
          'bulan_tahun': '2024-06-12'
        }));

    if (response.statusCode == 201) {
      print('Material added successfully');
    }

    print('Error adding material');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 460,
        child: Form(
          key: _materialFormKey,
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Kategori ID',
                        style: TextStyle(
                          color: Color(0xFF2E3440),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        controller: kategoriController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'masukkan id sub-kategori',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
              ),
              MaterialInputField(
                label: 'nama sub-kategori',
                controller: namaController,
                hintText: 'sub kategori',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: SizedBox(
                    height: 36,
                    width: 128,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // if (_materialFormKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(content: Text('processing')));
                        // }
                        submitMaterialForm();
                      },
                      label: const Text('add item'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
