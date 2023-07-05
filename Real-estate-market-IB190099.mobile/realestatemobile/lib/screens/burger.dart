// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:realestatemobile/screens/inbox.dart';
import 'package:realestatemobile/screens/my_profile.dart';
import 'package:realestatemobile/screens/saved_ads.dart';
import 'package:realestatemobile/screens/search_ads.dart';

class BurgerMenu extends StatefulWidget {
  const BurgerMenu({super.key});
  static const String routeName = "/burger";

  @override
  State<BurgerMenu> createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
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
                "Real estate menu",
                style: TextStyle(fontSize: 29),
              ),
            ))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MyProfile.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(bottom: 10, top: 20),
          child: Card(
            child: Container(
              width: 300,
              height: 45,
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.account_box_outlined,
                        size: 45,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "My profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Inbox.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            child: Container(
              width: 300,
              height: 45,
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.local_post_office_rounded,
                        size: 45,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Messages",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SearchAds.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            child: Container(
              width: 300,
              height: 45,
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.search,
                        size: 45,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Search ads",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            child: Container(
              width: 300,
              height: 45,
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.euro,
                        size: 45,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Payments",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SavedAds.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            child: Container(
              width: 300,
              height: 45,
              margin: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 45,
                      ),
                    ],
                  ), //prop image
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Saved ads",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ])))));
  }
}
