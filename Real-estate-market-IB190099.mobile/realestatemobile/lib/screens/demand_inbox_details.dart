// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, prefer_final_fields, unused_field, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:realestatemobile/model/message.dart';
import 'package:realestatemobile/providers/message_provider.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/demand_message.dart';
import '../providers/demand_message_provider.dart';

class DemandInboxDetails extends StatefulWidget {
  DemandInboxDetails({this.id, super.key});
  static const String routeName = "/demandInboxDetails";
  String? id;

  @override
  State<DemandInboxDetails> createState() => _DemandInboxDetailsState();
}

class _DemandInboxDetailsState extends State<DemandInboxDetails> {
  DemandMessageProvider? _messageProvider = null;
  List<DemandMessage> distinctAdvertiseMessages = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageProvider = context.read<DemandMessageProvider>();
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
                          "assets/images/logoReal.png",
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
          children: [_buildHeader()],
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 45),
          child: OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: Text('Send message for this article'),
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'You did not insert message';
                            }
                            return null;
                          },
                          controller: messageController,
                          maxLines: 8,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Type here")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade900)),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                        OutlinedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  var response = await sendMessage(
                                      distinctAdvertiseMessages[0]
                                          .demandAdvertiseId
                                          .toString());
                                  if (response.statusCode == 200) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text("Message sent"),
                                              content: Text(
                                                  "You sent message for this article"),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () => {
                                                          Navigator.pop(
                                                              context),
                                                          Navigator.pop(
                                                              context),
                                                          loadData()
                                                        },
                                                    child: Text("Ok"))
                                              ],
                                            ));
                                  }
                                } on Exception catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text("No action done"),
                                            content: Text(e.toString()),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () => {
                                                        Navigator.pop(context),
                                                      },
                                                  child: Text("Ok"))
                                            ],
                                          ));
                                }
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade900)),
                            child: Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    )
                  ],
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade900)),
            child: Text(
              "Reply",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Column(
          children: _buildMessages(),
        )
      ],
    )))));
  }

  Future<Response> sendMessage(String? advertiseId) async {
    Map<String, String> body = {
      "content": messageController.text,
      "senderId": Authorization.loggedUser!.id!.toString(),
      "timestamp": DateTime.now().toString(),
      "demandAdvertiseId": advertiseId!,
      "isEmployee": "0"
    };
    messageController.text = "";
    var response = await _messageProvider!.send(body);
    return response;
  }

  List<Widget> _buildMessages() {
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
                            Text(
                              x.isEmployee == 0 ? "You" : "Real estate market ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 40),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                x.content!,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.left,
                                softWrap: true,
                                maxLines: 2,
                              ),
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
        ?.get({'id': Authorization.loggedUser!.id}, "DemandMessage");

    setState(() {
      data = tmpData;
      distinctAdvertiseMessages.clear();
      data.forEach((x) => {
            if (x.demandAdvertiseId.toString() == widget.id)
              {distinctAdvertiseMessages.add(x)}
          });
    });
  }

  Widget _buildHeader() {
    if (distinctAdvertiseMessages.isEmpty) {
      return Text("No messages to show");
    }

    return GestureDetector(
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
                      "Demand ${distinctAdvertiseMessages[0].demandAdvertise?.location}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 40)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
