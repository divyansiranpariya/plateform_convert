import 'dart:io';

import 'package:flutter/material.dart';

class Contact {
  String name;
  String contact;
  DateTime? time;
  File? ima;

  Contact({
    required this.name,
    required this.contact,
    this.time,
    this.ima,
  });
}
