// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/model/advertise.dart';
import 'package:realestatemobile/providers/message_provider.dart';
import 'package:realestatemobile/utils/util.dart';

import '../providers/advertise_provider.dart';
import 'dart:convert';

class AdvertiseDetails extends StatefulWidget {
  static const String routeName = "/advertise_details";
  String? id;
  AdvertiseDetails({this.id, super.key});

  @override
  State<AdvertiseDetails> createState() => _AdvertiseDetailsState();
}

class _AdvertiseDetailsState extends State<AdvertiseDetails> {
  List<String> images = ["assets/images/logo.png", "assets/images/logo2.png"];
  final CarouselController _carouselController = CarouselController();
  TextEditingController messageController = TextEditingController();
  AdvertiseProvider? _advertiseProvider = null;
  Future<Advertise>? data;
  String saved = "Save";
  MessageProvider? _messageProvider;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();
    _messageProvider = context.read<MessageProvider>();

    loadData();
  }

  Future loadData() async {
    data = Future.value(
        await _advertiseProvider?.getById(this.widget.id!, "Advertise"));

    setState(() {
      data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Advertise>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<Advertise> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            Authorization.loggedUser?.savedAdvertisesIds?.forEach((x) => {
                  if (x == snapshot.data?.id) {saved = "Remove from saved"}
                });
            child = SafeArea(
                child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    _buildNav(snapshot.data!.id.toString()),
                    _buildSlider(),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            snapshot.data!.property!.name!,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          child: Text(
                            "\$${snapshot.data!.property?.price}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35),
                          child: Text(
                            "${snapshot.data!.property?.description}",
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
                              "Quadrature : ${snapshot.data!.property?.quadrature}m²",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Address : Bistarac bb, Lukavac",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Floors : ${snapshot.data!.property?.floors}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Property type: ${snapshot.data!.property?.propertyType}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Rooms : ${snapshot.data!.property?.rooms}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Year of construction : ${snapshot.data!.property?.yearOfConstruction}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Parking : ${snapshot.data!.property?.parking == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Water : ${snapshot.data!.property?.water == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Electricity : ${snapshot.data!.property?.electricity == 0 ? "No" : "Yes"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Price : \$${snapshot.data!.type == "rent" ? "${snapshot.data!.property?.price} per month" : "${snapshot.data!.property?.price}"}",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Contact : 00222555447",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildDetailsBottom(snapshot.data!.property?.name!,
                        snapshot.data!.id!.toString()),
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

  CarouselSlider _buildSlider() {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: _buildImages(),
    );
  }

  List<Widget> _buildImages() {
    return images.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.asset(
              url,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }).toList();
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
                  var response = await _advertiseProvider?.removeFromSaved(
                      advertiseId, "Advertise");

                  setState(() {
                    Authorization.loggedUser?.savedAdvertisesIds
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
                  var response = await _advertiseProvider?.saveAd(
                      advertiseId, "Advertise");

                  setState(() {
                    Authorization.loggedUser?.savedAdvertisesIds
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

  Container _buildDetailsBottom(String? propertyName, String? advertiseId) {
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: Text('Send message for article $propertyName'),
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
          OutlinedButton(
            child: Text(
              "Pay in advance",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade900)),
          )
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
      "advertiseId": advertiseId!,
      "isEmployee": "0"
    };

    messageController.text = "";
    var response = await _messageProvider!.send(body);
    return response;
  }
}
