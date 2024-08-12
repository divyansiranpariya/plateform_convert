import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plateform_convert_app/model/contactmodel.dart';
import 'package:plateform_convert_app/provisders/contact_provider.dart';
import 'package:provider/provider.dart';

class StepperProvider extends ChangeNotifier {
  int step = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  File? image;
  XFile? xFile;
  Future<void> pickImage() async {
    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      image = File(xFile!.path);
      notifyListeners();
    }
  }

  Future<void> pickImagecam() async {
    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      image = File(xFile!.path);
      notifyListeners();
    }
  }

  void forwordStep(BuildContext context) {
    if (step == 2) {
      Contact contact = Contact(
        name: namecontroller.text,
        contact: contactcontroller.text,
        ima: image,
      );
      Provider.of<ContactProvider>(context, listen: false)
          .addconatctfun(contact);
      Navigator.of(context).pop(context);
    }
    if (step < 2) {
      step++;
    }
    notifyListeners();
  }

  void backwordstep() {
    if (step > 0) {
      step--;
    }
    notifyListeners();
  }
}
