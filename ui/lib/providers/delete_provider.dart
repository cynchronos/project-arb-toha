import 'package:flutter/material.dart';

class DeleteProvider extends ChangeNotifier {
  String target = '';

  Future DeleteState(target) async {
    target = target;
    print("delete target : $target");
    notifyListeners();
  }
}
