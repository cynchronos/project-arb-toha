import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/providers/sub_kategori_provider.dart';

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
        child: Column(
          children: [
            Container(
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF2E3440),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'id',
                    style: TextStyle(color: Color(0xFFECEFF4)),
                  ),
                  Text(
                    'nama sub-kategori',
                    style: TextStyle(color: Color(0xFFECEFF4)),
                  ),
                  Text(
                    'nama kategori',
                    style: TextStyle(color: Color(0xFFECEFF4)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                child: ListView.builder(
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      final currentItem = subCategories[index];
                      return SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(currentItem.categoryID),
                            Text(currentItem.subCategoryName),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
