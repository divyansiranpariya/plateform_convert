import 'package:flutter/material.dart';

import '../model/contactmodel.dart';

class Callprovider extends ChangeNotifier {
  List<Contact> _callHistory = [];

  List<Contact> get callHistory => _callHistory;

  void addcall(Contact call) {
    _callHistory.add(call);
    notifyListeners();
  }
}

