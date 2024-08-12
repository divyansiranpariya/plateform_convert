import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/contactmodel.dart';
import '../../provisders/call_provider.dart';
import '../../provisders/contact_provider.dart';
import '../../provisders/plateform_convert_provider.dart';
import '../../provisders/stepper_provider.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoPageScaffold(
            backgroundColor: Color(0xff07524A),
            child: Column(
              children: [
                Expanded(
                  child: CupertinoNavigationBar(
                    backgroundColor: Color(0xff07524A),
                    middle: Text(
                      "QuickChat",
                      style:
                          TextStyle(color: CupertinoColors.white, fontSize: 24),
                    ),
                    trailing: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          Provider.of<PlateformProvider>(context, listen: false)
                              .changePlateform();
                        },
                        icon: Icon(
                          Icons.android_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xffF3F7EC),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 10,
                            child: Column(
                              children: [
                                ...Provider.of<ContactProvider>(context)
                                    .allcontact
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                'Detailpage',
                                                arguments: e);
                                          },
                                          child: Card(
                                            elevation: 3,
                                            color: CupertinoColors
                                                .extraLightBackgroundGray
                                                .withOpacity(0.5),
                                            margin: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20,
                                                top: 20),
                                            child: ListTile(
                                                title: Row(
                                                  children: [
                                                    CircleAvatar(
                                                        radius: 20,
                                                        backgroundImage:
                                                            FileImage(File(
                                                                e.ima!.path))),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${e.name},",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${e.contact}",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                trailing: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Column(
                                                    children: [],
                                                  ),
                                                )),
                                          ),
                                        ))
                                    .toList(),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 60, right: 15),
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          margin: EdgeInsets.only(top: 35),
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Color(0xff07524A),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                CupertinoIcons
                                                                    .delete_left)),
                                                        Text("Create contact",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white70)),
                                                      ],
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(CupertinoIcons
                                                            .ellipsis_vertical)),
                                                  ],
                                                ),
                                                SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: CupertinoColors
                                                              .white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                    35,
                                                                  ),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          35))),
                                                      height: 700,
                                                      width: double.infinity,
                                                      child: Column(
                                                        children: [
                                                          Consumer<
                                                              StepperProvider>(
                                                            builder: (context,
                                                                steped, _) {
                                                              return (steped
                                                                          .image ==
                                                                      null)
                                                                  ? Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                              top: 70),
                                                                      height:
                                                                          130,
                                                                      width:
                                                                          130,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200,
                                                                          shape:
                                                                              BoxShape.circle),
                                                                    )
                                                                  : CircleAvatar(
                                                                      radius:
                                                                          60,
                                                                      backgroundImage:
                                                                          FileImage(
                                                                              steped.image!),
                                                                    );
                                                            },
                                                          ),
                                                          TextButton(
                                                              onPressed: () {
                                                                showCupertinoModalPopup(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return CupertinoAlertDialog(
                                                                        title:
                                                                            Text(
                                                                          "Pick Image",
                                                                        ),
                                                                        content:
                                                                            Text("Choose Image from gallary or camera "),
                                                                        actions: <CupertinoDialogAction>[
                                                                          CupertinoDialogAction(
                                                                            child: Consumer<StepperProvider>(builder: (context,
                                                                                imagespro,
                                                                                _) {
                                                                              return FloatingActionButton(
                                                                                mini: true,
                                                                                elevation: 3,
                                                                                onPressed: () {
                                                                                  Provider.of<StepperProvider>(context, listen: false).pickImage();
                                                                                  print(imagespro.image);
                                                                                },
                                                                                child: Icon(CupertinoIcons.camera_rotate_fill),
                                                                              );
                                                                            }),
                                                                          ),
                                                                          CupertinoDialogAction(
                                                                            child: Consumer<StepperProvider>(builder: (context,
                                                                                imagespro,
                                                                                _) {
                                                                              return FloatingActionButton(
                                                                                mini: true,
                                                                                elevation: 3,
                                                                                onPressed: () {
                                                                                  Provider.of<StepperProvider>(context, listen: false).pickImagecam();
                                                                                  print(imagespro.image);
                                                                                },
                                                                                child: Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
                                                                              );
                                                                            }),
                                                                          )
                                                                        ],
                                                                      );
                                                                    });

                                                                //     });
                                                              },
                                                              child: Text(
                                                                  "Add picture")),
                                                          Consumer<
                                                              StepperProvider>(
                                                            builder: (context,
                                                                steps, _) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            20,
                                                                        top: 20,
                                                                        right:
                                                                            20),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Text(
                                                                              "Name",
                                                                              style: TextStyle(fontSize: 14, color: CupertinoColors.label),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              CupertinoTextField(
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: CupertinoColors.black)),
                                                                            controller:
                                                                                steps.namecontroller,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        CupertinoButton(
                                                                          onPressed:
                                                                              () {
                                                                            steps.forwordStep(context);
                                                                          },
                                                                          color:
                                                                              Colors.black12,
                                                                          minSize:
                                                                              5,
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              top: 10,
                                                                              bottom: 10,
                                                                              right: 20),
                                                                          child:
                                                                              Text(
                                                                            "Next",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        CupertinoButton(
                                                                          onPressed:
                                                                              () {},
                                                                          color:
                                                                              Colors.black12,
                                                                          minSize:
                                                                              5,
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              top: 10,
                                                                              bottom: 10,
                                                                              right: 20),
                                                                          child:
                                                                              Text(
                                                                            "Cancel",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          35,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Text(
                                                                              "Contact",
                                                                              style: TextStyle(fontSize: 14, color: CupertinoColors.label),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              CupertinoTextField(
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: CupertinoColors.black)),
                                                                            controller:
                                                                                steps.contactcontroller,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "chat",
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        CupertinoButton(
                                                                          onPressed:
                                                                              () {
                                                                            steps.forwordStep(context);
                                                                          },
                                                                          color:
                                                                              Colors.black12,
                                                                          minSize:
                                                                              5,
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            "Next",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        CupertinoButton(
                                                                          onPressed:
                                                                              () {},
                                                                          color:
                                                                              Colors.black12,
                                                                          minSize:
                                                                              5,
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            "Cancel",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          35,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                shape: CircleBorder(),
                                backgroundColor:
                                    Color(0xff07524A).withOpacity(0.8),
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: CupertinoColors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ))
        : Scaffold(
            backgroundColor: Color(0xff07524A),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: (context),
                    builder: (context) {
                      return Bottomsheet();
                    });
              },
              mini: true,
              backgroundColor: Color(0xff07524A).withOpacity(0.8),
              child: Icon(
                Icons.message_outlined,
                size: 20,
                color: Colors.white,
              ),
            ),
            body: Container(
                margin: EdgeInsets.only(top: 20),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffF3F7EC),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(35))),
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    Contact index =
                        Provider.of<ContactProvider>(context).allcontact[i];
                    return Container(
                      margin: EdgeInsets.only(left: 14, right: 14, top: 15),
                      //  color: Colors.white70,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('Detailpage', arguments: index);
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(index.ima!.path)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("${index.name}"),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await launchUrl(
                                          Uri.parse("tel:${index.contact}"));
                                      Provider.of<Callprovider>(context,
                                              listen: false)
                                          .addcall(
                                        Contact(
                                            contact: index.contact,
                                            name: index.name,
                                            time: DateTime.now()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.call,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  itemCount:
                      Provider.of<ContactProvider>(context).allcontact.length,
                )),
          );
  }
}

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white70,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff07524A),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            )),
                        Text(
                          "Create contact",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Consumer<StepperProvider>(
                      builder: (context, stepprovide, _) {
                        return Stepper(
                            currentStep: stepprovide.step,
                            controlsBuilder: (context, _) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          stepprovide.forwordStep(context);
                                        },
                                        child: Text((stepprovide.step == 2)
                                            ? "save"
                                            : "next")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    (stepprovide.step == 0)
                                        ? Container()
                                        : OutlinedButton(
                                            onPressed: () {
                                              stepprovide.backwordstep();
                                            },
                                            child: Text("cancle")),
                                  ],
                                ),
                              );
                            },
                            steps: [
                              Step(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Profile",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "Add profile photo",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                content: Column(
                                  children: [
                                    Consumer<StepperProvider>(
                                      builder: (context, steped, _) {
                                        return (steped.image == null)
                                            ? Container(
                                                height: 130,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle),
                                              )
                                            : CircleAvatar(
                                                radius: 60,
                                                backgroundImage:
                                                    FileImage(steped.image!),
                                              );
                                      },
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Pick Image",
                                                  ),
                                                  content: Text(
                                                      "Choose Image from gallary or camera "),
                                                  actions: [
                                                    Consumer<StepperProvider>(
                                                        builder: (context,
                                                            imagespro, _) {
                                                      return FloatingActionButton(
                                                        mini: true,
                                                        elevation: 3,
                                                        onPressed: () {
                                                          Provider.of<StepperProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .pickImage();
                                                          print(
                                                              imagespro.image);
                                                        },
                                                        child: Icon(Icons
                                                            .browse_gallery_outlined),
                                                      );
                                                    }),
                                                    Consumer<StepperProvider>(
                                                        builder: (context,
                                                            imagespro, _) {
                                                      return FloatingActionButton(
                                                        mini: true,
                                                        elevation: 3,
                                                        onPressed: () {
                                                          Provider.of<StepperProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .pickImagecam();
                                                          print(
                                                              imagespro.image);
                                                        },
                                                        child:
                                                            Icon(Icons.camera),
                                                      );
                                                    }),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Text("Add picture")),
                                  ],
                                ),
                              ),
                              Step(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                      ),
                                      Text(
                                        "Enter Your Name",
                                      ),
                                    ],
                                  ),
                                  content: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: TextField(
                                      controller: stepprovide.namecontroller,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: InputBorder.none,
                                        hintText: "Enter your name",
                                      ),
                                    ),
                                  )),
                              Step(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Contact No",
                                      ),
                                      Text(
                                        "Enter Contact NO.",
                                      ),
                                    ],
                                  ),
                                  content: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: TextField(
                                      controller: stepprovide.contactcontroller,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none,
                                          hintText: "Enter your Number"),
                                    ),
                                  )),
                            ]);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
