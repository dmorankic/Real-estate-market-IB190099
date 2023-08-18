import 'package:flutter/material.dart';
import 'package:realestatemobile/screens/create_ad.dart';
import 'package:realestatemobile/screens/demand.dart';
import 'package:realestatemobile/screens/sale.dart';
import 'rent.dart';

// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous
class SearchAds extends StatefulWidget {
  const SearchAds({super.key});
  static const String routeName = "/search";

  @override
  State<SearchAds> createState() => _SearchAdsState();
}

class _SearchAdsState extends State<SearchAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )),
              ),
              SizedBox(height: 17),
              Text(
                'Real estate market',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'What are you looking for?',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Sale.routeName);
                            },
                            child: Text('Sale'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Rent.routeName);
                            },
                            child: Text('Rent'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Demand.routeName);
                            },
                            child: Text('Demand'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, CreateAd.routeName);
                            },
                            child: Text(
                              'Create ad request',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
