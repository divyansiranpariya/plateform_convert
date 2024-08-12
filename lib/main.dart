import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plateform_convert_app/provisders/call_provider.dart';
import 'package:plateform_convert_app/provisders/contact_provider.dart';
import 'package:plateform_convert_app/provisders/datetime_provider.dart';
import 'package:plateform_convert_app/provisders/plateform_convert_provider.dart';
import 'package:plateform_convert_app/provisders/stepper_provider.dart';
import 'package:plateform_convert_app/provisders/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Views/Story_view.dart';
import 'Views/detailpage.dart';
import 'Views/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PlateformProvider()),
    ChangeNotifierProvider(create: (_) => ContactProvider()),
    ChangeNotifierProvider(
      create: (_) => StepperProvider(),
    ),
    ChangeNotifierProvider(create: (_) => DateTimeProvider()),
    ChangeNotifierProvider(create: (_) => Callprovider()),
    ChangeNotifierProvider(create: (_) => themeprovider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomePage(),
              'Detailpage': (context) => Detailpage(),
            },
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: (Provider.of<themeprovider>(context).apptheme.isdark)
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: {
              '/': (context) => HomePage(),
              'Detailpage': (context) => Detailpage(),
              'StoryView': (context) => StoryView()
            },
          );
  }
}
