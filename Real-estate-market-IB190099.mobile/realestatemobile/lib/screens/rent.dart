// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:provider/provider.dart';

// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous
class Rent extends StatefulWidget {
  const Rent({super.key});
  static const String routeName = "/rent";

  @override
  State<Rent> createState() => _RentState();
}

class _RentState extends State<Rent> {
  AdvertiseProvider? _advertiseProvider = null;
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();
    print("called initstate");
    loadData();
  }

  Future loadData() async {
    var tmpData = await _advertiseProvider?.get(null);
    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("called build");

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                child: Text.rich(
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
                          "Real estate rent",
                          style: TextStyle(fontSize: 29),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SizedBox(
                  width: 300,
                  height: 25,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: data,
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 21.0,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      isDense: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: Colors.black)),
                child: Card(
                  child: Container(
                    width: 300,
                    margin: EdgeInsets.all(6.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.0)),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(10, 10)),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(35),
                                  child: Image.asset("assets/images/logo2.png",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100.00,
                          width: 190.00,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Heading",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Headinglorem ipsum da bil ipsum loremso vskiasfasd asdhhhhh",
                                style: TextStyle(
                                  fontSize: 11.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 188,
                                child: Text(
                                  "\$300",
                                  style: TextStyle(
                                    fontSize: 11.5,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
