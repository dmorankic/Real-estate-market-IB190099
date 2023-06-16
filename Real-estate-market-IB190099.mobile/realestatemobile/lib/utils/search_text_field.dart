// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realestatemobile/utils/shared.dart';

import '../providers/advertise_provider.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField(
      {super.key,
      required this.advertiseProvider,
      required this.data,
      required this.type});
  AdvertiseProvider advertiseProvider;
  dynamic data = {};
  String type;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  AdvertiseProvider? _advertiseProvider = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _advertiseProvider = widget.advertiseProvider;
    data = widget.data;
    type = widget.type;
  }

  dynamic data = {};
  String? type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox(
            width: 300,
            height: 25,
            child: TextField(
              onSubmitted: (value) async {
                var tmpData = await _advertiseProvider
                    ?.get({'PropertyName': value, 'Type': type});
                setState(() {
                  Shared.data = tmpData;
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
        ),
      ],
    );
  }
}
