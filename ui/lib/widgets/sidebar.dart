import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/pages/kategori_page.dart';
import 'package:ui/pages/material_alat_upah_page.dart';
import 'package:ui/providers/pages_provider.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Grey color with 10% opacity
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(1, 0), // dx = 1, dy = 0
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<PagesProvider>()
                                  .switchPages('kategori');
                            },
                            child: const Text('Kategori')),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<PagesProvider>()
                                  .switchPages('material');
                            },
                            child: const Text('Daftar Material')),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<PagesProvider>()
                                  .switchPages('analisa');
                            },
                            child: const Text('Analisa')),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<PagesProvider>()
                                  .switchPages('daftar analisa');
                            },
                            child: const Text('Daftar Analisa')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
