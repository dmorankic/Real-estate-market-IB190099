// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/utils/search_text_field.dart';
import 'package:realestatemobile/utils/util.dart';
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
  AdvertiseProvider? _advertiseProvider = null;
  dynamic data = {};
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData =
        await _advertiseProvider?.get({'Type': 'demand'}, "Advertise");

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
                  ?.get({'PropertyName': value, 'Type': type}, "Advertise");

              setState(() {
                data = tmpData;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 2),
              border: InputBorder.none,
              hintText: "Search",
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
                {'PropertyName': searchController.text, 'Type': type},
                "Advertise");

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
                  context, "${AdvertiseDetails.routeName}/${x.id}");
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
                              "${x.property?.name}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${x.property?.description}",
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
                                "\$${x.property?.price}",
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
          ),
        )
        .cast<Widget>()
        .toList();
    return list;
  }
}
