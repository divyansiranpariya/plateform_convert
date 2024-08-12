import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provisders/call_provider.dart';
import '../../provisders/plateform_convert_provider.dart';

class CallComponent extends StatefulWidget {
  const CallComponent({super.key});

  @override
  State<CallComponent> createState() => _CallComponentState();
}

class _CallComponentState extends State<CallComponent> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        color: Color(0xff07524A),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 40, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Calls",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.qrcode,
                                        color: CupertinoColors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.search,
                                        color: CupertinoColors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.ellipsis_vertical,
                                        color: CupertinoColors.white,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ))),
                Expanded(
                  flex: 13,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Consumer<Callprovider>(
                                builder: (context, call, _) {
                              return ListView.builder(
                                  itemBuilder: (context, i) {
                                    final allcall = call.callHistory[i];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14, bottom: 20),
                                      child: Container(
                                        height: 70,
                                        width: 340,
                                        decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    allcall.name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  // Text(
                                                  //   allcall.contact,
                                                  //   style:
                                                  //       TextStyle(color: Colors.white, fontSize: 11),
                                                  // ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.call,
                                                color: Colors.green,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: call.callHistory.length);
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : Scaffold(
            backgroundColor: Color(0xff07524A),
            body: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF3F7EC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(35))),
              child: Consumer<Callprovider>(builder: (context, call, _) {
                return ListView.builder(
                    itemBuilder: (context, i) {
                      final allcall = call.callHistory[i];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 29),
                        child: Card(
                          child: Container(
                            height: 70,
                            width: 340,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        allcall.name,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      (allcall.time!.hour <= 12)
                                          ? Text(
                                              "${allcall.time!.hour - 12}:${allcall.time?.minute} AM")
                                          : Text(
                                              "${allcall.time!.hour - 12}:${allcall.time?.minute} AM")
                                      // Text(
                                      //   allcall.contact,
                                      //   style:
                                      //       TextStyle(color: Colors.white, fontSize: 11),
                                      // ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: call.callHistory.length);
              }),
            ),
          );
  }
}
