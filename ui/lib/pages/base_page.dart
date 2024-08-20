import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/pages/kategori_page.dart';
import 'package:ui/pages/material_alat_upah_page.dart';
import 'package:ui/providers/pages_provider.dart';
import 'package:ui/widgets/sidebar.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    final page = context.watch<PagesProvider>().pages;
    print(page);
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          const SizedBox(
            width: 20,
          ),
          Visibility(
              visible: page == 'material',
              child: const Expanded(child: MaterialAlatUpahPage())),
          Visibility(
              visible: page == 'kategori',
              child: Expanded(
                  child: Visibility(
                      visible: page == 'kategori', child: kategoriPage())))
        ],
      ),
    );
  }
}
