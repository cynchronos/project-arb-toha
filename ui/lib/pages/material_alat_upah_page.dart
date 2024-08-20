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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [MaterialForm(), const SearchWidget(), const Materialtable()],
    ));
  }
}
