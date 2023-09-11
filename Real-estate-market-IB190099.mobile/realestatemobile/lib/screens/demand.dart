// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:realestatemobile/providers/demand_advertise_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/utils/util.dart';

import 'demand_advertise_details.dart';

// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous

class Demand extends StatefulWidget {
  const Demand({super.key});
  static const String routeName = "/demand";
  @override
  State<Demand> createState() => _DemandState();
}

class _DemandState extends State<Demand> {
  DemandAdvertiseProvider? _advertiseProvider = null;
  dynamic data = {};
  TextEditingController searchController = TextEditingController();
  final String _baseUrl = 'https://10.0.2.2:7006/';

  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<DemandAdvertiseProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _advertiseProvider
        ?.get({'Status': 'approved'}, "DemandAdvertise");

    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (Authorization.loggedUser != null) {
                      Navigator.pushNamed(context, BurgerMenu.routeName);
                    }
                  },
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
                            "Real estate demand",
                            style: TextStyle(fontSize: 29),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                _buildSearch('demand'),
                SizedBox(height: 8),
                Column(
                  children: buildAdvertisesCardList(),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSearch(String? type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 270,
          height: 35,
          child: TextField(
            controller: searchController,
            onSubmitted: (value) async {
              var tmpData = await _advertiseProvider
                  ?.get({'PropertyName': value}, "DemandAdvertise");

              setState(() {
                data = tmpData;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 2),
              border: InputBorder.none,
              hintText: "Search by location",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 21.0,
              ),
              hintStyle: TextStyle(color: Colors.grey[400]),
              isDense: true,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () async {
            var tmpData = await _advertiseProvider?.get(
                {'PropertyName': searchController.text}, "DemandAdvertise");

            setState(() {
              data = tmpData;
            });
          },
        ),
      ],
    );
  }

  List<Widget> buildAdvertisesCardList() {
    if (data.length == 0) {
      return [Text("No items match your search")];
    }
    if (data == null) {
      return [Text("Loading...")];
    }

    List<Widget> list = data
        .map(
          (x) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, "${DemandAdvertiseDetails.routeName}/${x.id}");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black)),
              margin: EdgeInsets.only(bottom: 10),
              child: Card(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.00,
                        width: 190.00,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${x.type}",
                                  style: TextStyle(
                                    fontSize: 11.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "${x.propertyType}",
                                  style: TextStyle(
                                    fontSize: 11.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Description : ${x.description?.length > 79 ? x.description.substring(0, 93) : x.description}",
                              style: TextStyle(
                                fontSize: 11.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Location : ${x.location}",
                              style: TextStyle(
                                fontSize: 11.5,
                              ),
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
        )
        .cast<Widget>()
        .toList();
    return list;
  }
}
