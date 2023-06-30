// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/model/advertise.dart';

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
  AdvertiseProvider? _advertiseProvider = null;
  Future<Advertise>? data;

  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();

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
            child = SafeArea(
                child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    _buildNav(),
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
                    _buildDetailsBottom(),
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

  Container _buildNav() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          OutlinedButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _advertiseProvider?.saveAd("20", "6", "Advertise");
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

  Container _buildDetailsBottom() {
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
              onPressed: () {},
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
}
