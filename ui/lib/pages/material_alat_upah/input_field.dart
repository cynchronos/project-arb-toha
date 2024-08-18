import 'package:flutter/material.dart';

class MaterialInputField extends StatelessWidget {
  final String label;
  final  TextEditingController controller;

  const MaterialInputField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF2E3440),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 36,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'nama material',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
          )
        ],
      ),
    );
  }
}
