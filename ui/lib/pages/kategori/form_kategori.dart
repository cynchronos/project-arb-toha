import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui/domain/kategori/add_kategori.dart';

class KategoriForm extends StatefulWidget {
  KategoriForm({super.key});

  @override
  State<KategoriForm> createState() => _KategoriState();
}

class _KategoriState extends State<KategoriForm> {
  final _materialFormKey = GlobalKey<FormState>();

  final TextEditingController kategoriController = TextEditingController();
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
                        'Nama Kategori',
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
                        controller: kategoriController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'masukkan kategori material',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
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
                        addKategori(kategoriController.text);
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
