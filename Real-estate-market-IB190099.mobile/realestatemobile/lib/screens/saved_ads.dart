// ignore_for_file: sized_box_for_whitespace, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/utils/util.dart';

import '../providers/demand_advertise_provider.dart';
import 'demand_advertise_details.dart';

// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous

class SavedAds extends StatefulWidget {
  const SavedAds({super.key});
  static const String routeName = "/saved";
  @override
  State<SavedAds> createState() => _SavedAdsState();
}

class _SavedAdsState extends State<SavedAds> {
  AdvertiseProvider? _advertiseProvider = null;
  DemandAdvertiseProvider? _demandAdvertiseProvider = null;

  dynamic data = {};
  dynamic demandData = {};

  TextEditingController searchController = TextEditingController();
  final String _baseUrl = 'https://10.0.2.2:7006/';

  @override
  void initState() {
    super.initState();
    _advertiseProvider = context.read<AdvertiseProvider>();
    _demandAdvertiseProvider = context.read<DemandAdvertiseProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData;
    var tmpDemand;

    if (Authorization.loggedUser == null) {
      tmpData = "Not logged in";
    } else {
      tmpData = await _advertiseProvider?.getSaved(
          "Advertise/SavedAdv?userId=${Authorization.loggedUser!.id}");
      tmpDemand = await _demandAdvertiseProvider?.getSaved(
          "DemandAdvertise/SavedAdv?userId=${Authorization.loggedUser!.id}");
    }

    setState(() {
      data = tmpData;
      demandData = tmpDemand;
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
                    Navigator.pushNamed(context, BurgerMenu.routeName)
                        .then((value) => {loadData()});
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
                            "Saved advertises",
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
                  children: buildAdvertisesCardList(),
                ),
                Column(
                  children: buildDemandAdvertisesCardList(),
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
    if (data.length == 0 && demandData.length == 0) {
      return [Text("You have not saved any advertise")];
    }
    if (data == null) {
      return [Text("Loading...")];
    }
    if (data == "Not logged in") {
      return [Text(data)];
    }
    List<Widget> list = data
        .map(
          (x) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                      context, "${AdvertiseDetails.routeName}/${x.id}")
                  .then((value) => {loadData()});
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
                                    child: x.property?.images.isEmpty
                                        ? Image.asset(
                                            "assets/images/NoImage.png",
                                            fit: BoxFit.cover)
                                        : Image.network(
                                            '$_baseUrl${x.property?.images[0]}',
                                            fit: BoxFit.cover)),
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
                              "${x.property?.description.length > 93 ? x.property?.description.substring(0, 93) : x.property?.description}",
                              style: TextStyle(
                                fontSize: 11.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
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

  List<Widget> buildDemandAdvertisesCardList() {
    if (demandData.length == 0 && data.length == 0) {
      return [Text("You have not saved any advertise")];
    }
    if (demandData == null) {
      return [Text("Loading...")];
    }
    if (demandData == "Not logged in") {
      return [Text(demandData)];
    }
    List<Widget> list = demandData
        .map(
          (x) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                      context, "${DemandAdvertiseDetails.routeName}/${x.id}")
                  .then((value) => {loadData()});
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
