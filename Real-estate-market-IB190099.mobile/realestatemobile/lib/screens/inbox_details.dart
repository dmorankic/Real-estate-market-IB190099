// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:realestatemobile/model/message.dart';
import 'package:realestatemobile/providers/message_provider.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/utils/util.dart';

class InboxDetails extends StatefulWidget {
  InboxDetails({this.id, super.key});
  static const String routeName = "/inboxDetails";
  String? id;

  @override
  State<InboxDetails> createState() => _InboxDetailsState();
}

class _InboxDetailsState extends State<InboxDetails> {
  MessageProvider? _messageProvider = null;

  @override
  void initState() {
    super.initState();
    _messageProvider = context.read<MessageProvider>();
    print(widget.id);
    loadData();
  }

  bool exists = false;
  dynamic data = {};
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
        )
      ],
    )))));
  }

  List<Widget> _buildMessages() {
    if (data.length == 0) {
      return [Text("No messages to show")];
    }
    if (data == null) {
      return [Text("Loading...")];
    }
    List<Message> distinctAdvertiseMessages = [];
    // data.forEach((x) => {
    //       if (distinctAdvertiseMessages.isEmpty)
    //         {distinctAdvertiseMessages.add(x)}
    //       else
    //         {
    //           for (int i = 0; i < distinctAdvertiseMessages.length; i++)
    //             {
    //               if (x.advertiseId == distinctAdvertiseMessages[i].advertiseId)
    //                 {
    //                   setState(
    //                     () {
    //                       exists = true;
    //                     },
    //                   )
    //                 }
    //             },
    //           if (exists == false) {distinctAdvertiseMessages.add(x)},
    //           setState(
    //             () {
    //               exists = false;
    //             },
    //           )
    //         }
    //     });
    data.forEach((x) => {
          if (x.advertiseId.toString() == widget.id)
            {distinctAdvertiseMessages.add(x)}
        });
    List<Widget> list = distinctAdvertiseMessages
        .map((x) => GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 340,
                margin: EdgeInsets.only(top: 15),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(6.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButton(),
                            Text(
                              x.advertise!.property!.name!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 40)
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Container(
                        //       margin: EdgeInsets.only(left: 30),
                        //       child: Text(
                        //         x.isEmployee == 0
                        //             ? "You : ${x.content!.length > 20 ? x.content!.substring(0, 20) : x.content}..."
                        //             : "Real estate : ${x.content!.length > 20 ? x.content!.substring(0, 20) : x.content}...",
                        //         style: TextStyle(fontSize: 15),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     Text(
                        //       DateFormat.jm().format(
                        //           DateTime.parse(x.timestamp.toString())),
                        //       style: TextStyle(fontSize: 15),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ],
                        // )
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
        ?.get({'userId': Authorization.loggedUser!.id}, "Message");

    setState(() {
      data = tmpData;
    });
  }
}
