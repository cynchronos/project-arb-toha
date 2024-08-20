import 'package:flutter/material.dart';

class MaterialDropdownProvider extends ChangeNotifier {
  String target = '';

  Future setDropdownState(input) async {
    target = input;
    print("dropdown state : $target");
    notifyListeners();
  }
}
