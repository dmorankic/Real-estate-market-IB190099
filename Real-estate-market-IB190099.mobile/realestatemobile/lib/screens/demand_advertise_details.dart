// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/utils/util.dart';
import '../model/demand_advertise.dart';
import '../providers/demand_advertise_provider.dart';
import '../providers/demand_message_provider.dart';

class DemandAdvertiseDetails extends StatefulWidget {
  static const String routeName = "/demand_advertise_details";
  String? id;
  DemandAdvertiseDetails({this.id, super.key});

  @override
  State<DemandAdvertiseDetails> createState() => _DemandAdvertiseDetailsState();
}

class _DemandAdvertiseDetailsState extends State<DemandAdvertiseDetails> {
  final String _baseUrl = 'http://10.0.2.2:7006/';

  TextEditingController messageController = TextEditingController();
  DemandAdvertiseProvider? _demandAdvertiseProvider = null;
  Future<DemandAdvertise>? data;
  String saved = "Save";
  DemandMessageProvider? _demandMessageProvider;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _demandAdvertiseProvider = context.read<DemandAdvertiseProvider>();
    _demandMessageProvider = context.read<DemandMessageProvider>();

    loadData();
  }

  Future loadData() async {
    data = Future.value(await _demandAdvertiseProvider?.getById(
        this.widget.id!, "DemandAdvertise"));

    setState(() {
      data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DemandAdvertise>(
        future: data,
        builder:
            (BuildContext context, AsyncSnapshot<DemandAdvertise> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            Authorization.loggedUser?.savedDemandAdvertisesIds?.forEach((x) => {
                  if (x == snapshot.data?.id) {saved = "Remove from saved"}
                });
            child = SafeArea(
                child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    _buildNav(snapshot.data!.id.toString()),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "Demand",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35),
                          child: Text(
                            "${snapshot.data!.description}",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Min. Quadrature : ${snapshot.data!.minQuadrature}m²",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Max. Quadrature : ${snapshot.data!.maxQuadrature}m²",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Location : ${snapshot.data!.location}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Floors : ${snapshot.data!.floors}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Property type: ${snapshot.data!.propertyType}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Rooms : ${snapshot.data!.rooms}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Parking : ${snapshot.data!.parking == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Water : ${snapshot.data!.water == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Electricity : ${snapshot.data!.electricity == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Contact : ${snapshot.data?.user != null ? snapshot.data?.user!.phone : ' not provided'}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildDetailsBottom(snapshot.data!.id!.toString())
                  ],
                ),
              ),
            ));
          } else if (snapshot.hasError) {
            child = Row(children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ]);
          } else {
            child = Row(children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ]);
          }
          return child;
        },
      ),
    );
  }

  Container _buildNav(String advertiseId) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          BackButton(),
          OutlinedButton(
            child: Text(
              saved,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              if (Authorization.loggedUser == null) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Not logged in"),
                          content: Text("Please log in for further actions"),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Ok"))
                          ],
                        ));
                return;
              }

              if (saved == "Remove from saved") {
                try {
                  var response = await _demandAdvertiseProvider
                      ?.removeFromSaved(advertiseId, "DemandAdvertise");

                  setState(() {
                    Authorization.loggedUser?.savedDemandAdvertisesIds
                        ?.remove(int.parse(advertiseId));
                    saved = "Save";
                  });

                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Advertise removed from saved"),
                            content:
                                Text("You removed this advertise from saved"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          ));
                } on Exception catch (e) {
                  print(e.toString());
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("No action done"),
                            content: Text(e.toString()),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          ));
                }
              } else if (saved == "Save") {
                try {
                  var response = await _demandAdvertiseProvider?.saveAd(
                      advertiseId, "DemandAdvertise");

                  setState(() {
                    Authorization.loggedUser?.savedDemandAdvertisesIds
                        ?.add(int.parse(advertiseId));
                    saved = "Remove from saved";
                  });

                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Advertise saved successfully"),
                            content: Text("You saved this advertise"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          ));
                } on Exception catch (e) {
                  print(e.toString());
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("No action done"),
                            content: Text(e.toString()),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          ));
                }
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade900)),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Container _buildDetailsBottom(String? advertiseId) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 150,
            child: OutlinedButton(
              child: Text(
                "Send message for this article",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (Authorization.loggedUser == null) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Not logged in"),
                            content: Text("Please log in for further actions"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          ));
                  return;
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: Text('Send message for article'),
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
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade900))),
                          OutlinedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    var response =
                                        await sendMessage(advertiseId);
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
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text("Ok"))
                                              ],
                                            ));
                                  }
                                }
                              },
                              child: Text(
                                "Send",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade900)))
                        ],
                      )
                    ],
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade900)),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
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
    var response = await _demandMessageProvider!.send(body);
    return response;
  }
}
