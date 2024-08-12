import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provisders/datetime_provider.dart';
import '../../provisders/plateform_convert_provider.dart';

class SettingComponent extends StatefulWidget {
  const SettingComponent({super.key});

  @override
  State<SettingComponent> createState() => _SettingComponentState();
}

class _SettingComponentState extends State<SettingComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DateTimeProvider>(context, listen: false).dateinit();
    Provider.of<DateTimeProvider>(context, listen: false).timeInt();
  }

  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).plateform.isAndroid ==
            false)
        ? CupertinoPageScaffold(
            backgroundColor: Color(0xff07524A),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Settings",
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
                                        CupertinoIcons.ellipsis_vertical,
                                        color: CupertinoColors.white,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ))),
                Expanded(
                  flex: 14,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: CupertinoColors.systemPurple),
                              ),
                              Consumer<DateTimeProvider>(
                                builder: (context, dated, _) {
                                  return Text(
                                    dated.date,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: CupertinoColors.systemPurple),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<DateTimeProvider>(context,
                                          listen: false)
                                      .CupertinoDateTime(context);
                                },
                                child: Text("Change Date")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: CupertinoColors.systemPurple),
                              ),
                              Consumer<DateTimeProvider>(
                                  builder: ((context, timed, _) {
                                return Text(
                                  timed.time,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: CupertinoColors.systemPurple),
                                );
                              })),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<DateTimeProvider>(context,
                                          listen: false)
                                      .cupertinoTime(context);
                                },
                                child: Text("Change Time")),
                          ),
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
              margin: EdgeInsets.only(top: 20),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffF3F7EC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(fontSize: 18),
                        ),
                        Consumer<DateTimeProvider>(
                          builder: (contetx, dated, _) {
                            return Text(
                              dated.date,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Provider.of<DateTimeProvider>(context,
                                      listen: false)
                                  .changedate(context);
                            },
                            child: Text("Change Date"))),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Consumer<DateTimeProvider>(
                          builder: (context, timed, _) {
                            return Text(
                              timed.time,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<DateTimeProvider>(context,
                                    listen: false)
                                .changeTime(context);
                          },
                          child: Text("Change Time"),
                        )),
                  ],
                ),
              ),
            ));
  }
}
