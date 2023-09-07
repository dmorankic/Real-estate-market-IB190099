// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestatemobile/model/message.dart';
import 'package:realestatemobile/providers/message_provider.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/screens/inbox_details.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/demand_message.dart';
import '../providers/demand_message_provider.dart';
import 'demand_inbox_details.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});
  static const String routeName = "/inbox";

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  MessageProvider? _messageProvider = null;
  DemandMessageProvider? _demandMessageProvider = null;

  @override
  void initState() {
    super.initState();
    _messageProvider = context.read<MessageProvider>();
    _demandMessageProvider = context.read<DemandMessageProvider>();

    loadData();
  }

  bool exists = false;
  bool demandExists = false;
  dynamic data = {};
  dynamic demandData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 30,
                ),
                children: [
                  WidgetSpan(
                      style: TextStyle(height: 40),
                      child: Container(
                        height: 33,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 40,
                          height: 42,
                        ),
                      )),
                  WidgetSpan(
                      child: Container(
                    margin: EdgeInsets.only(left: 14.0, top: 10),
                    child: Text(
                      "Real estate messages",
                      style: TextStyle(fontSize: 29),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
        Column(
          children: _buildMessages(),
        ),
        Column(
          children: _buildDemandMessages(),
        )
      ],
    )))));
  }

  List<Widget> _buildMessages() {
    if (data.length == 0 && demandData.length == 0) {
      return [Text("No messages to show")];
    }
    if (data == null) {
      return [Text("Loading...")];
    }
    List<Message> distinctAdvertiseMessages = [];
    data.forEach((x) => {
          if (distinctAdvertiseMessages.isEmpty)
            {distinctAdvertiseMessages.add(x)}
          else
            {
              for (int i = 0; i < distinctAdvertiseMessages.length; i++)
                {
                  if (x.advertiseId == distinctAdvertiseMessages[i].advertiseId)
                    {
                      setState(
                        () {
                          exists = true;
                        },
                      )
                    }
                },
              if (exists == false) {distinctAdvertiseMessages.add(x)},
              setState(
                () {
                  exists = false;
                },
              )
            }
        });

    List<Widget> list = distinctAdvertiseMessages
        .map((x) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                        context, "${InboxDetails.routeName}/${x.advertiseId}")
                    .then((value) => {loadData()});
              },
              child: Container(
                alignment: Alignment.center,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.only(top: 15),
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              x.advertise!.property!.name!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                x.isEmployee == 0
                                    ? "You : ${x.content!.length > 20 ? x.content!.substring(0, 20) : x.content}..."
                                    : "Real estate : ${x.content!.length > 12 ? x.content!.substring(0, 12) : x.content}...",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              DateUtils.isSameDay(
                                      DateTime.parse(x.timestamp.toString()),
                                      DateTime.now())
                                  ? DateFormat.jm().format(
                                      DateTime.parse(x.timestamp.toString()))
                                  : DateUtils.isSameMonth(
                                          DateTime.parse(
                                              x.timestamp.toString()),
                                          DateTime.parse(
                                              x.timestamp.toString()))
                                      ? DateTime.now()
                                                      .difference(
                                                          DateTime.parse(x
                                                              .timestamp
                                                              .toString()))
                                                      .inDays +
                                                  1 ==
                                              1
                                          ? "yesterday"
                                          : "${(DateTime.now().difference(DateTime.parse(x.timestamp.toString())).inDays + 1).toString()} days ago"
                                      : DateFormat.yMMMMd('en_US').format(
                                          DateTime.parse(
                                              x.timestamp.toString())),
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .cast<Widget>()
        .toList();
    return list;
  }

  List<Widget> _buildDemandMessages() {
    if (demandData.length == 0 && data.length == 0) {
      return [Text("No messages to show")];
    }
    if (demandData == null) {
      return [Text("Loading...")];
    }
    List<DemandMessage> distinctAdvertiseMessages = [];
    demandData.forEach((x) => {
          if (distinctAdvertiseMessages.isEmpty)
            {distinctAdvertiseMessages.add(x)}
          else
            {
              for (int i = 0; i < distinctAdvertiseMessages.length; i++)
                {
                  if (x.demandAdvertiseId ==
                      distinctAdvertiseMessages[i].demandAdvertiseId)
                    {
                      setState(
                        () {
                          demandExists = true;
                        },
                      )
                    }
                },
              if (demandExists == false) {distinctAdvertiseMessages.add(x)},
              setState(
                () {
                  demandExists = false;
                },
              )
            }
        });

    List<Widget> list = distinctAdvertiseMessages
        .map((x) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,
                        "${DemandInboxDetails.routeName}/${x.demandAdvertiseId}")
                    .then((value) => {loadData()});
              },
              child: Container(
                alignment: Alignment.center,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.only(top: 15),
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Demand ${x.demandAdvertise?.location}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                x.isEmployee == 0
                                    ? "You : ${x.content!.length > 20 ? x.content!.substring(0, 20) : x.content}..."
                                    : "Real estate : ${x.content!.length > 12 ? x.content!.substring(0, 12) : x.content}...",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              DateUtils.isSameDay(
                                      DateTime.parse(x.timestamp.toString()),
                                      DateTime.now())
                                  ? DateFormat.jm().format(
                                      DateTime.parse(x.timestamp.toString()))
                                  : DateUtils.isSameMonth(
                                          DateTime.parse(
                                              x.timestamp.toString()),
                                          DateTime.parse(
                                              x.timestamp.toString()))
                                      ? DateTime.now()
                                                      .difference(
                                                          DateTime.parse(x
                                                              .timestamp
                                                              .toString()))
                                                      .inDays +
                                                  1 ==
                                              1
                                          ? "yesterday"
                                          : "${(DateTime.now().difference(DateTime.parse(x.timestamp.toString())).inDays + 1).toString()} days ago"
                                      : DateFormat.yMMMMd('en_US').format(
                                          DateTime.parse(
                                              x.timestamp.toString())),
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .cast<Widget>()
        .toList();
    return list;
  }

  Future loadData() async {
    var tmpData = await _messageProvider
        ?.get({'id': Authorization.loggedUser!.id}, "Message");

    var tmpDemand = await _demandMessageProvider
        ?.get({'id': Authorization.loggedUser!.id}, "DemandMessage");

    setState(() {
      data = tmpData;
      demandData = tmpDemand;
    });
  }
}
