import 'package:flutter/material.dart';

class MaterialInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;

  const MaterialInputField(
      {super.key,
      required this.label,
      required this.controller,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          SizedBox(
            height: 36,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder()),
            ),
          )
        ],
      ),
    );
  }
}
