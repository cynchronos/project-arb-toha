import 'package:flutter/material.dart';
import 'package:ui/pages/kategori/form_kategori.dart';
import 'package:ui/pages/kategori/form_sub_kategori.dart';
import 'package:ui/pages/kategori/tabel_kategori.dart';
import 'package:ui/pages/kategori/tabel_sub_kategori.dart';

class kategoriPage extends StatefulWidget {
  @override
  _kategoriPageState createState() => _kategoriPageState();
}

class _kategoriPageState extends State<kategoriPage> {
  // Add your state variables and methods here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KategoriForm(),
            const SizedBox(
              height: 12,
            ),
            const Flexible(flex: 1, child: Kategoritable())
          ],
        )),
        const SizedBox(
          height: 12,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubKategoriForm(),
            const SizedBox(
              height: 12,
            ),
            const Flexible(flex: 1, child: SubKategoritable())
          ],
        ))
        // const Kategoritable()
      ],
    ));
  }
}
