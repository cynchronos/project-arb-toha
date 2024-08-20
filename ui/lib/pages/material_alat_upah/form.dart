import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/pages/material_alat_upah/input_field.dart';
import 'package:http/http.dart' as http;
import 'package:ui/providers/material_dropdown_provider.dart';
import 'package:ui/providers/sub_kategori_provider.dart';

class MaterialForm extends StatefulWidget {
  MaterialForm({super.key});

  @override
  State<MaterialForm> createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  final _materialFormKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();

  final TextEditingController satuanController = TextEditingController();

  final TextEditingController hargaController = TextEditingController();

  final TextEditingController areaController = TextEditingController();

  final TextEditingController keteranganController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SubKategoriProvider>().fetchSubKategoriData();
  }

  Future submitMaterialForm(materialID) async {
    print(materialID);
    final url = Uri.parse(
        'http://127.0.0.1:3000/api/material-alat-dan-upah/list-material/');
    final response = await http.post(url,
        headers: {'content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'material_id': materialID,
          'satuan': satuanController.text,
          'harga': hargaController.text,
          'area': areaController.text,
          'bulan_tahun': keteranganController.text
        }));

    if (response.statusCode == 200) {
      print('Material added successfully');
    }
    print(response.body);
  }

  idFinder(subCategories, subCategoryName) {
    // print(subCategories);
    for (var subCategory in subCategories) {
      if (subCategory.subCategoryName == subCategoryName) {
        return subCategory.materialID;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = context.watch<SubKategoriProvider>().subCategories;
    var dropDownState = context.watch<MaterialDropdownProvider>().target;
    var dropDownvalue =
        subCategories.isNotEmpty ? subCategories[0].subCategoryName : '';

    return subCategories.isEmpty
        ? Container()
        : SizedBox(
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
                            'Kategori',
                            style: TextStyle(
                              color: Color(0xFF2E3440),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 460,
                            height: 36,
                            child: DropdownButton<String>(
                              value: dropDownvalue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownvalue = newValue!;
                                  context
                                      .read<MaterialDropdownProvider>()
                                      .setDropdownState(idFinder(
                                          subCategories, dropDownvalue));
                                });
                              },
                              items:
                                  subCategories.map((SubKategori subkategori) {
                                return DropdownMenuItem(
                                    value: subkategori.subCategoryName,
                                    child: Text(subkategori.subCategoryName));
                              }).toList(),
                            ))
                      ],
                    ),
                  ),
                  MaterialInputField(
                    label: 'Nama',
                    controller: namaController,
                    hintText: 'batu asah',
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: MaterialInputField(
                            label: 'Satuan',
                            controller: satuanController,
                            hintText: 'm3',
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          flex: 2,
                          child: MaterialInputField(
                            label: 'harga',
                            controller: hargaController,
                            hintText: '20.000',
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: MaterialInputField(
                            label: 'Area',
                            controller: areaController,
                            hintText: 'jawa barat',
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          flex: 2,
                          child: MaterialInputField(
                            label: 'Keterangan',
                            controller: keteranganController,
                            hintText: '2023-12-06',
                          ))
                    ],
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
                            submitMaterialForm(dropDownState);
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
