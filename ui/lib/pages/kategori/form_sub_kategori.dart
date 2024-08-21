import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/domain/subcat/add_subcat.dart';
import 'package:ui/pages/material_alat_upah/material_input_field.dart';
import 'package:http/http.dart' as http;

class SubKategoriForm extends StatefulWidget {
  SubKategoriForm({super.key});

  @override
  State<SubKategoriForm> createState() => _SubKategoriState();
}

class _SubKategoriState extends State<SubKategoriForm> {
  final _materialFormKey = GlobalKey<FormState>();

  final TextEditingController subKategoriIDController = TextEditingController();
  final TextEditingController subKategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 460,
        child: Form(
          key: _materialFormKey,
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        'pilih jenis kategori',
                        style: TextStyle(
                          color: Color(0xFF2E3440),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        controller: subKategoriIDController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'masukkan id sub-kategori',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
              ),
              MaterialInputField(
                label: 'nama sub-kategori',
                controller: subKategoriController,
                hintText: 'sub kategori',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: SizedBox(
                    height: 36,
                    width: 128,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // if (_materialFormKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(content: Text('processing')));
                        // }
                        // addSubcat(categoryID, subKategoriController)
                      },
                      label: const Text('add item'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
