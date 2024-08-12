import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plateform_convert_app/provisders/call_provider.dart';
import 'package:plateform_convert_app/provisders/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contactmodel.dart';
import '../provisders/plateform_convert_provider.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

DateTime time = DateTime.now();

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    Contact detail = ModalRoute.of(context)!.settings.arguments as Contact;
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Column(
              children: [
                CupertinoNavigationBar(
                  backgroundColor: Color(0xff07524A),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  middle: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: FileImage(File(detail.ima!.path)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail.name,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            // SizedBox(
                            //   height: 6,
                            // ),
                            // Text(
                            //   detail.contact,
                            //   style:
                            //       TextStyle(fontSize: 10, color: Colors.white70),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:${detail.contact}"));
                      Provider.of<Callprovider>(context, listen: false).addcall(
                        Contact(
                            contact: detail.contact,
                            name: detail.name,
                            time: DateTime.now()),
                      );
                    },
                    child: Container(
                      child: Icon(
                        CupertinoIcons.phone,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff07524A),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: CupertinoColors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: FileImage(File(detail.ima!.path)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.name,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          detail.contact,
                          style: TextStyle(fontSize: 10, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse("tel:${detail.contact}"));
                      Provider.of<Callprovider>(context, listen: false).addcall(
                        Contact(
                            contact: detail.contact,
                            name: detail.name,
                            time: DateTime.now()),
                      );
                    },
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call_sharp,
                      color: Colors.white,
                    )),
              ],
            ),
            body: Container(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/image/imag1.png"))),
                ),
          );
    ;
  }
}
