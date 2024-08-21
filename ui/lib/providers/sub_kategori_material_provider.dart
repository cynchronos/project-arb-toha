import 'package:flutter/material.dart';

class SubKategoriDropdownProvider extends ChangeNotifier {
  String target = '';

  Future setDropdownState(input) async {
    target = input;
    print("dropdown state : $target");
    notifyListeners();
  }
}
