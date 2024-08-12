import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provisders/plateform_convert_provider.dart';
import '../provisders/theme_provider.dart';
import '../utils/teststyling.dart';
import 'components/Call_component.dart';
import 'components/Setting_component.dart';
import 'components/Stories_component.dart';
import 'components/chat_component.dart';
import 'detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<Map<String, dynamic>> allcomponents = [
    {
      'lable': "chats",
      'widget': ChatComponent(),
    },
    {
      'lable': "Story",
      'widget': StoriesComponent(),
    },
    {
      'lable': "Calls",
      'widget': CallComponent(),
    },
    {
      'lable': "Settings",
      'widget': SettingComponent(),
    },
  ];

  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.chat_bubble_2,
                  ),
                  label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rotate_left), label: "Stories"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: "Callls"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings_solid), label: "Setting"),
            ]),
            tabBuilder: (context, val) {
              return CupertinoTabView(
                routes: {
                  'Detailpage': (context) => Detailpage(),
                },
                builder: (context) {
                  return allcomponents[val]['widget'];
                },
              );
            },
            backgroundColor: Color(0xff07524A),
          )
        : Scaffold(
            backgroundColor: Color(0xff07524A),
            appBar: AppBar(
              title: Text(
                "QuickChat",
                style: Textstyling.title,
              ),
              backgroundColor: Color(0xff07524A),
              bottom: TabBar(
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white70))),
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text(
                      "Chats",
                      style: Textstyling.title,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Stories",
                      style: Textstyling.title,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Calls",
                      style: Textstyling.title,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Setting",
                      style: Textstyling.title,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Provider.of<PlateformProvider>(context, listen: false)
                          .changePlateform();
                    },
                    icon: Icon(
                      Icons.apple,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: Color(0xff07524A),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                                left: 12,
                                right: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Pic Image"),
                                              content: Text(
                                                  "choose image for profile"),
                                              actions: [
                                                // FloatingActionButton(
                                                //   mini: true,
                                                //   elevation: 3,
                                                //   onPressed: () async {
                                                //     xFile = await pickmages.pickImage(
                                                //         source: ImageSource.camera);
                                                //     setState(() {
                                                //       if (xFile != null) {
                                                //         pickImagePath  = xFile!.path;
                                                //       }
                                                //     });
                                                //   },
                                                //   child:
                                                //       Icon(Icons.camera_alt_outlined),
                                                // ),
                                                // FloatingActionButton(
                                                //   mini: true,
                                                //   elevation: 3,
                                                //   onPressed: () async {
                                                //     xFile = await pickmages.pickImage(
                                                //         source: ImageSource.gallery);
                                                //     // setState(() {
                                                //     //   if (xFile != null) {
                                                //     //     imagepath = xFile!.path;
                                                //     //   }
                                                //     // });
                                                //   },
                                                //   child: Icon(Icons.browse_gallery),
                                                // )
                                              ],
                                            );
                                          });
                                    },
                                    child: CircleAvatar(
                                      radius: 45,
                                      // backgroundImage: (imagepath != null)
                                      //     ? FileImage(File(imagepath!))
                                      //     : null,
                                      // child: (imagepath != null)
                                      //     ? Container()
                                      //     : Container(
                                      //   alignment: Alignment.center,
                                      //   child: Text(
                                      //     "DR",
                                      //     style: TextStyle(
                                      //         fontSize: 40, letterSpacing: 1),
                                      //   ),
                                      // ),
                                      child: Text(
                                        "D",
                                        style: TextStyle(fontSize: 50),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Provider.of<themeprovider>(context,
                                                listen: false)
                                            .changetheme();
                                      },
                                      icon: Icon(
                                        Icons.light_mode_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DIVYANSHI RANAPRIYA",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    "+91 9327664424",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        // color: Color(0xff1A1D24),
                        height: double.infinity,
                        width: double.infinity,
                        // color: Colors.pink,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40,
                                          //  color: Colors.cyan,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .account_circle_outlined,
                                                      size: 31,
                                                    ),
                                                    SizedBox(
                                                      width: 13,
                                                    ),
                                                    Text("My Profile"),
                                                  ],
                                                ),
                                                // Icon(
                                                //   Icons.arrow_forward_ios_rounded,
                                                //   size: 17,
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          //color: Colors.cyan,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushNamed('FavouritePage');
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        size: 27,
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text("Favourite")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Divider(
                                thickness: 2,
                                color: Colors.black87,
                              ),
                              Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            //color: Colors.amber,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.group, size: 28),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Text("New Group"),
                                                ],
                                              ),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<PlateformProvider>(
                                                  context,
                                                  listen: false)
                                              .changePlateform();
                                        },
                                        child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            // color: Colors.amber,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .contact_page_outlined,
                                                      size: 26),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Text("New"
                                                      " Contacts"),
                                                ],
                                              ),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            // color: Colors.amber,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.apple_outlined,
                                                      size: 26),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Text("IOS-View"),
                                                ],
                                              ),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            // color: Colors.amber,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.save_outlined,
                                                      size: 26),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Text("All Saved"),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.settings, size: 26),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text("Settings"),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      // color: Colors.blue
                                      )),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            body: TabBarView(controller: tabController, children: [
              ChatComponent(),
              StoriesComponent(),
              CallComponent(),
              SettingComponent(),
            ]),
          );
  }
}
