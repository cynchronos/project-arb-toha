import 'package:flutter/material.dart';
import 'package:ui/pages/material_alat_upah/form.dart';
import 'package:ui/pages/material_alat_upah/material_table.dart';
import 'package:ui/pages/material_alat_upah/search.dart';
import 'package:ui/widgets/sidebar.dart';

class MaterialAlatUpahPage extends StatefulWidget {
  const MaterialAlatUpahPage({super.key});

  @override
  State<MaterialAlatUpahPage> createState() => _MaterialAlatUpahPageState();
}

class _MaterialAlatUpahPageState extends State<MaterialAlatUpahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: <Widget>[
          const Flexible(
            flex: 1,
            child: Sidebar(),
          ),
          const SizedBox(width: 12),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialForm(),
                const SearchWidget(),
                Materialtable(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
