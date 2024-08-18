import 'package:flutter/material.dart';

class MaterialAlatUpah extends StatefulWidget {
  @override
  _MaterialAlatUpahState createState() => _MaterialAlatUpahState();
}

class _MaterialAlatUpahState extends State<MaterialAlatUpah> {
  // Add your state variables and methods here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Alat Upah'),
      ),
      body: const Center(
        child: Text('Your content goes here'),
      ),
    );
  }
}
