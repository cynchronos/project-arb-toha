import 'package:flutter/material.dart';

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
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Grey color with 10% opacity
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(1, 0), // dx = 1, dy = 0
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                const Text('AHS'),
                Container(
                  width: 180,
                  child: Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {}, child: const Text('Material')),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Analisa Harga Satuan')),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 180,
                        height: 36,
                        child: TextButton(
                            onPressed: () {}, child: const Text('Daftar AHS')),
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
