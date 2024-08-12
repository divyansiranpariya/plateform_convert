import 'package:flutter/material.dart';

import '../model/theme_model.dart';

class themeprovider extends ChangeNotifier {
  Apptheme apptheme = Apptheme(isdark: false);

  void changetheme() {
    apptheme.isdark = !apptheme.isdark;
    notifyListeners();
  }
}
