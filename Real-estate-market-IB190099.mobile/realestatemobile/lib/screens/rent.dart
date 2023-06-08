// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                //color: Colors.amber,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
