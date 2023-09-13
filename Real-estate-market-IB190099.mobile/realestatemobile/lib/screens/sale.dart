// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/advertise.dart';
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous

class Sale extends StatefulWidget {
  const Sale({super.key});
  static const String routeName = "/sale";
  @override
  State<Sale> createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  AdvertiseProvider? _advertiseProvider = null;
  Future<List<Advertise>>? data;
  TextEditingController searchController = TextEditingController();
  final String _baseUrl = 'http://10.0.2.2:7006/';

  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();

    loadData();
  }

  Future loadData() async {
    if (Authorization.loggedUser == null) {
      data = Future.value(await _advertiseProvider
          ?.get({'Type': 'sale', 'Status': 'approved'}, "Advertise"));
    } else {
      data = Future.value(await _advertiseProvider?.get(
          {'Type': 'sale', 'UserId': Authorization.loggedUser!.id},
          "Advertise/recommendations"));
    }
    if (mounted) {
      setState(() {
        data = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Advertise>>(
          future: data,
          builder:
              (BuildContext context, AsyncSnapshot<List<Advertise>> snapshot) {
            Widget child;
            if (snapshot.hasData) {
              child = SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Authorization.loggedUser != null) {
                              Navigator.pushNamed(
                                  context, BurgerMenu.routeName);
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
                                        "assets/images/logoReal.png",
                                        width: 40,
                                        height: 42,
                                      ),
                                    )),
                                WidgetSpan(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 14.0, top: 10),
                                  child: Text(
                                    "Real estate sale",
                                    style: TextStyle(fontSize: 29),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildSearch('sale'),
                        SizedBox(height: 8),
                        Column(
                          children: buildAdvertisesCardList(snapshot.data!),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              child = SafeArea(
                child: Row(children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ]),
              );
            } else {
              child = SafeArea(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: Text('Loading ads...'),
                        ),
                      ]),
                    ],
                  ),
                ),
              );
            }
            return child;
          }),
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
              data = Future.value(await _advertiseProvider?.get(
                  {'PropertyName': value, 'Type': type, 'Status': 'approved'},
                  "Advertise"));

              if (mounted) {
                setState(() {
                  data = data;
                });
              }
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
            data = Future.value(await _advertiseProvider?.get({
              'PropertyName': searchController.text,
              'Type': type,
              'Status': 'approved'
            }, "Advertise"));

            if (mounted) {
              setState(() {
                data = data;
              });
            }
          },
        ),
      ],
    );
  }

  List<Widget> buildAdvertisesCardList(List<Advertise> data) {
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
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Column(
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
                                  child: x.property!.images!.isEmpty
                                      ? Image.asset("assets/images/NoImage.png",
                                          fit: BoxFit.cover)
                                      : Image.network(
                                          '$_baseUrl${x.property?.images![0]}',
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100.00,
                        width: 190.00,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${x.property?.name}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${x.property!.description!.length > 93 ? x.property?.description!.substring(0, 93) : x.property?.description}",
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
