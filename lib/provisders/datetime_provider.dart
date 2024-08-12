import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  late String date;
  DateTime dateTime = DateTime.now();
  DateTime? pickDate;

  late String time;
  TimeOfDay times = TimeOfDay.now();
  TimeOfDay? pickTime;

  void changedate(BuildContext context) async {
    pickDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        helpText: "DatePicker",
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickDate != null) {
      date = "${pickDate!.day}/${pickDate!.month}/${pickDate!.year}";
    }

    notifyListeners();
  }

  void dateinit() {
    date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    notifyListeners();
  }

  void changeTime(BuildContext context) async {
    pickTime = await showTimePicker(context: context, initialTime: times);
    if (pickTime != null) {
      time = "${pickTime!.hour}:${pickTime!.minute}";
    }
    notifyListeners();
  }

  void timeInt() {
    if (times.hour <= 12) {
      time = "${times.hour - 12}:${times.minute} AM";
    } else {
      time = "${times.hour - 12}:${times.minute} PM";
    }
    notifyListeners();
  }

  void CupertinoDateTime(BuildContext context) async {
    pickDate = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            color: CupertinoColors.secondaryLabel,
            child: CupertinoDatePicker(
              initialDateTime: dateTime,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime picked) {
                date = "${picked.day}/${picked.month}/${picked.year}";
              },
            ),
          );
        });

    if (pickDate != null) {
      date = "${pickDate!.day}/${pickDate!.month}/${pickDate!.year}";
      ;
    }
    notifyListeners();
  }

  cupertinoTime(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          color: CupertinoColors.secondaryLabel,
          child: CupertinoDatePicker(
            initialDateTime: dateTime,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (DateTime picked) {
              if (picked.hour <= 12) {
                time = "${picked.hour}:${picked.minute} AM";
              } else {
                time = "${picked.hour}:${picked.minute} PM";
              }
            },
          ),
        );
      },
    );
    notifyListeners();
  }
}
