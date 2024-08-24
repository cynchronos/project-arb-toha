import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/domain/material_alat_upah/src/add_material.dart';
import 'package:ui/domain/material_alat_upah/src/get_daftar_material.dart';
import 'package:ui/domain/subcat/get_subcat.dart';
import 'package:ui/pages/material_alat_upah/material_input_field.dart';
import 'package:ui/providers/material_dropdown_provider.dart';
import 'package:ui/providers/material_provider.dart';
import 'package:ui/providers/sub_kategori_provider.dart';
// import 'package:ui/providers/sub_kategori_provider.dart';

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

  StreamController myStreamController = StreamController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  idFinder(subcats, subcatname) {
    // print(subCategories);
    for (var subcat in subcats) {
      if (subcat.subCatName == subcatname) {
        print("From idFinder");
        print(subcat.subCatID);
        var result = subcat.subCatID;
        return result;
      }
    }
  }

  Future<List<dynamic>> loadData() async {
    var response = await getSubCat();

    var result = response as List<dynamic>;
    context
        .read<MaterialDropdownProvider>()
        .setDropdownState(result[0].subCatName);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final materialList = context.watch<SubKategoriProvider>().subCategories;
    var dropDownState = context.watch<MaterialDropdownProvider>().target;
    var materialIDState = context.watch<MaterialProvider>().materialIDState;
    var dropDownvalue = '';

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
                          value: dropDownState,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownvalue = newValue!;
                              context
                                  .read<MaterialDropdownProvider>()
                                  .setDropdownState(dropDownvalue);
                              context
                                  .read<MaterialProvider>()
                                  .setMaterialIDState(
                                      idFinder(materialList, dropDownvalue));
                            });
                            idFinder(materialList, dropDownvalue);
                          },
                          items: materialList.map((material) {
                            return DropdownMenuItem(
                                value: material.subCatName,
                                child: Text(material.subCatName));
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
                        addMaterial(
                            materialIDState,
                            satuanController.text,
                            hargaController.text,
                            areaController.text,
                            keteranganController.text);
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

    // return FutureBuilder(
    //   future: loadData(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return const Text('Error loading data');
    //     } else if (!snapshot.hasData) {
    //       return const Text('No data available');
    //     } else {
    //       var snapshots = snapshot.data!;
    //       var dropdownValue = snapshots[0].materialName;
    //       var fuck = (snapshots as List<DaftarMaterial>)
    //           .map((material) => material.materialName);

    //       print(fuck);

    //     }
    //   },
    // );
  }
}

          // return SizedBox(
          //     width: 460,
          //     child: Form(
          //       key: _materialFormKey,
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Padding(
          //                   padding: EdgeInsets.only(bottom: 6),
          //                   child: Text(
          //                     'Kategori',
          //                     style: TextStyle(
          //                       color: Color(0xFF2E3440),
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                     width: 460,
          //                     height: 36,
          //                     child: DropdownButton<String>(
          //                       value: dropDownValue,
          //                       onChanged: (String? newValue) {
          //                         setState(() {
          //                           dropDownValue = newValue!;
          //                           context
          //                               .read<MaterialDropdownProvider>()
          //                               .setDropdownState(dropDownValue);
          //                         });
          //                         idFinder(materials, dropDownValue);
          //                       },
          //                       items: (materials as List<DaftarMaterial>)
          //                           .map<DropdownMenuItem<String>>((material) {
          //                         return DropdownMenuItem(
          //                             value: material.materialName,
          //                             child: Text(material.materialName));
          //                       }).toList(),
          //                     ))
          //               ],
          //             ),
          //           ),
          //           MaterialInputField(
          //             label: 'Nama',
          //             controller: namaController,
          //             hintText: 'batu asah',
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                   flex: 1,
          //                   child: MaterialInputField(
          //                     label: 'Satuan',
          //                     controller: satuanController,
          //                     hintText: 'm3',
          //                   )),
          //               const SizedBox(
          //                 width: 4,
          //               ),
          //               Expanded(
          //                   flex: 2,
          //                   child: MaterialInputField(
          //                     label: 'harga',
          //                     controller: hargaController,
          //                     hintText: '20.000',
          //                   ))
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Expanded(
          //                   flex: 1,
          //                   child: MaterialInputField(
          //                     label: 'Area',
          //                     controller: areaController,
          //                     hintText: 'jawa barat',
          //                   )),
          //               const SizedBox(
          //                 width: 4,
          //               ),
          //               Expanded(
          //                   flex: 2,
          //                   child: MaterialInputField(
          //                     label: 'Keterangan',
          //                     controller: keteranganController,
          //                     hintText: '2023-12-06',
          //                   ))
          //             ],
          //           ),
          //           Align(
          //             alignment: Alignment.centerRight,
          //             child: Padding(
          //               padding: const EdgeInsets.only(top: 14),
          //               child: SizedBox(
          //                 height: 36,
          //                 width: 128,
          //                 child: ElevatedButton.icon(
          //                   onPressed: () {
          //                     addMaterial(
          //                         idFinder(materials, dropDownValue),
          //                         satuanController.text,
          //                         hargaController.text,
          //                         areaController.text,
          //                         keteranganController.text);
          //                   },
          //                   label: const Text('add item'),
          //                   style: ElevatedButton.styleFrom(
          //                       shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(6))),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     ));
