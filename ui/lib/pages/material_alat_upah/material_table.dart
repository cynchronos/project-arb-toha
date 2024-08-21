import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/domain/material_alat_upah/src/delete_material.dart';
import 'package:ui/domain/material_alat_upah/src/edit_material.dart';
import 'package:ui/pages/material_alat_upah/material_input_field.dart';
import 'package:ui/providers/material_provider.dart';

class Materialtable extends StatefulWidget {
  const Materialtable({super.key});

  @override
  State<Materialtable> createState() => _MaterialtableState();
}

class _MaterialtableState extends State<Materialtable> {
  List materialContainer = [];

  final TextEditingController satuanController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MaterialProvider>().getDaftarMaterial();
  }

  @override
  Widget build(BuildContext context) {
    final materials = context.watch<MaterialProvider>().daftarMaterials;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(children: [
          Container(
            color: const Color(0xFF2E3440),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'No',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Nama',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Satuan',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Harga',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Area',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Keterangan',
                            style: TextStyle(color: Color(0xFFECEFF4)),
                          )),
                    )),
                Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: false,
                      child: Container(
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  print('edit button is clicked');
                                },
                                child: Text('Edit')),
                            TextButton(
                                onPressed: () {
                                  print('delete button is clicked');
                                },
                                child: Text('delete'))
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: materials.length,
                    itemBuilder: (context, index) {
                      final currentItem = materials[index];
                      final itemNumber = index + 1;
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(itemNumber.toString())),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(currentItem.materialName)),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(currentItem.satuan)),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(currentItem.harga)),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(currentItem.area)),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(currentItem.keterangan)),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            print(
                                                'edit $index button is clicked');
                                            showDialog<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title:
                                                      const Text('edit item'),
                                                  content: Form(
                                                      child: Column(
                                                    children: [
                                                      MaterialInputField(
                                                          label: 'satuan',
                                                          controller:
                                                              satuanController,
                                                          hintText:
                                                              'edit satuan'),
                                                      MaterialInputField(
                                                          label: 'harga',
                                                          controller:
                                                              hargaController,
                                                          hintText:
                                                              'edit harga'),
                                                      MaterialInputField(
                                                          label: 'area',
                                                          controller:
                                                              areaController,
                                                          hintText:
                                                              'edit area'),
                                                      MaterialInputField(
                                                          label: 'keterangan',
                                                          controller:
                                                              keteranganController,
                                                          hintText:
                                                              'edit keterangan')
                                                    ],
                                                  )),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge,
                                                      ),
                                                      child:
                                                          const Text('Confirm'),
                                                      onPressed: () {
                                                        print(
                                                            'tombol edit ditekan');
                                                        editMaterial(
                                                            currentItem.listID,
                                                            currentItem
                                                                .materialID,
                                                            satuanController
                                                                .text,
                                                            hargaController
                                                                .text,
                                                            areaController.text,
                                                            keteranganController
                                                                .text);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge,
                                                      ),
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text('Edit')),
                                      TextButton(
                                          onPressed: () {
                                            print(
                                                "delete button of ${currentItem.materialName}");
                                            showDialog<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'ingin menghapus item ?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge,
                                                      ),
                                                      child:
                                                          const Text('Delete'),
                                                      onPressed: () {
                                                        deleteMaterial(
                                                            currentItem.listID);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge,
                                                      ),
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text('delete'))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    })),
          )
        ]),
      ),
    );
  }
}
        // child: Column(
        //   children: [
        //     Container(
        //       height: 48,
        //       decoration: const BoxDecoration(
        //         color: Color(0xFF2E3440),
        //         borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(4),
        //           topLeft: Radius.circular(4),
        //         ),
        //       ),
        //       child: const Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Flexible(
        //             child: Text(
        //               'No',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //           Flexible(
        //             child: Text(
        //               'Nama',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //           Flexible(
        //             child: Text(
        //               'Satuan',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //           Flexible(
        //             child: Text(
        //               'Harga',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //           Flexible(
        //             child: Text(
        //               'Area',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //           Flexible(
        //             child: Text(
        //               'Keterangan',
        //               style: TextStyle(color: Color(0xFFECEFF4)),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: const Color(0xFFFFFFFF),
        //           borderRadius: const BorderRadius.only(
        //             bottomRight: Radius.circular(4),
        //             bottomLeft: Radius.circular(4),
        //           ),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.3),
        //               spreadRadius: 2,
        //               blurRadius: 5,
        //               offset: const Offset(2, 3),
        //             ),
        //           ],
        //         ),
        //         child: ListView.builder(
        //             itemCount: materials.length,
        //             itemBuilder: (context, index) {
        //               final currentItem = materials[index];
        //               return SizedBox(
        //                 height: 48,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Text(currentItem.number),
        //                     Text(currentItem.kategori),
        //                     Text(currentItem.satuan),
        //                     Text(currentItem.harga),
        //                     Text(currentItem.area),
        //                     Text(currentItem.keterangan),
        //                   ],
        //                 ),
        //               );
        //             }),
        //       ),
        //     )
        //   ],
        // ),
