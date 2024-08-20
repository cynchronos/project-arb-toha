import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  String pages = 'material';

  Future switchPages(pageName) async {
    pages = pageName;
    print(pages);
    notifyListeners();
  }
}
