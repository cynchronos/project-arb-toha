import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/domain/material_alat_upah/src/delete_material.dart';
import 'package:ui/domain/subcat/delete_subcat.dart';
import 'package:ui/providers/sub_kategori_provider.dart';
import 'package:ui/providers/delete_provider.dart';

class SubKategoritable extends StatefulWidget {
  const SubKategoritable({super.key});

  @override
  State<SubKategoritable> createState() => _SubKategoritableState();
}

class _SubKategoritableState extends State<SubKategoritable> {
  List materialContainer = [];

  @override
  void initState() {
    super.initState();
    context.read<SubKategoriProvider>().fetchSubKategoriData();
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = context.watch<SubKategoriProvider>().subCategories;
    return Container(
        width: 960,
        // margin: const EdgeInsets.only(right: 20, bottom: 20),
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
        child: Column(
          children: [
            Container(
                color: const Color(0xFF2E3440),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'id',
                              style: TextStyle(color: Color(0xFFECEFF4)),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'sub-kategori',
                              style: TextStyle(color: Color(0xFFECEFF4)),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'nama sub-kategori',
                              style: TextStyle(color: Color(0xFFECEFF4)),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
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
                          )),
                    )
                  ],
                )),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      final currentItem = subCategories[index];
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(currentItem.subCatID),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(currentItem.categoryName),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(currentItem.subCatName),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Edit')),
                                    TextButton(
                                        onPressed: () {
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'ingin menghapus item ?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('Delete'),
                                                    onPressed: () {
                                                      deleteSubcat(
                                                          currentItem.subCatID);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('Cancel'),
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
                                        child: const Text('Delete'))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
