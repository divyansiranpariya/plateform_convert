import 'package:flutter/material.dart';

import '../model/contactmodel.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> allcontact = [];
  List<Contact> filteredContacts = <Contact>[];

  void addconatctfun(Contact contact) {
    allcontact.add(contact);
    notifyListeners();
  }

  void removeconatctfun(Contact contact) {
    allcontact.remove(contact);
    notifyListeners();
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContacts = List.from(allcontact);
    } else {
      filteredContacts = allcontact.where((contact) {
        return contact.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
