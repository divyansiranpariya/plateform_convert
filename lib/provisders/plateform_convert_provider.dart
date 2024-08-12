import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plateform_convert_app/model/plateform_model.dart';

class PlateformProvider extends ChangeNotifier {
  Plateform plateform = Plateform(isAndroid: true);

  void changePlateform() {
    plateform.isAndroid = !plateform.isAndroid;
    notifyListeners();
  }
}
