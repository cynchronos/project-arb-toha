import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'daftar material',
            style: TextStyle(
              fontWeight: FontWeight.w500, // Medium font weight
              fontSize: 16, // Font size of 16
              color: Color(0xFF2E3440), // Hex color #2E3440
            ),
          ),
          Container(
            width: 380,
            height: 36,
            child: TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Search material',
                  prefixIcon: Container(
                    color: const Color(0xFF2E3440),
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFFECEFF4),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 4)),
            ),
          )
        ],
      ),
    );
  }
}
