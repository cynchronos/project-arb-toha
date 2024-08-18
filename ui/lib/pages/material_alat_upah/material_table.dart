import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/domain/material_alat_upah/src/getMaterial.dart';
import 'package:ui/providers/material_provider.dart';

class Materialtable extends StatefulWidget {
  const Materialtable({super.key});

  @override
  State<Materialtable> createState() => _MaterialtableState();
}

class _MaterialtableState extends State<Materialtable> {
  List materialContainer = [];

  @override
  void initState() {
    super.initState();
    context.read<MaterialProvider>().fetchMaterialdata();
  }

  @override
  Widget build(BuildContext context) {
    final materials = context.watch<MaterialProvider>().materials;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        decoration: BoxDecoration(
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
        child: IntrinsicHeight(
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
                      'No',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                    Text(
                      'Nama',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                    Text(
                      'Satuan',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                    Text(
                      'Harga',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                    Text(
                      'Area',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                    Text(
                      'Keterangan',
                      style: TextStyle(color: Color(0xFFECEFF4)),
                    ),
                  ],
                ),
              ),
              Flexible(
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
                    itemCount: materials.length,
                    itemBuilder: (context, index) {
                      final currentItem = materials[index];
                      return SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(currentItem.number),
                            Text(currentItem.kategori),
                            Text(currentItem.satuan),
                            Text(currentItem.harga),
                            Text(currentItem.area),
                            Text(currentItem.keterangan),
                          ],
                        ),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
