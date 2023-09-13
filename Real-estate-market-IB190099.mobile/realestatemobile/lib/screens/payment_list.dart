// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/providers/payment_provider.dart';

import '../utils/util.dart';
import 'burger.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});
  static const String routeName = "/payment-list";

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  dynamic data = {};
  PaymentProvider? _paymentProvider = null;

  @override
  void initState() {
    super.initState();
    _paymentProvider = context.read<PaymentProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _paymentProvider
        ?.get({'id': Authorization.loggedUser!.id}, "Payment");

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
                                "assets/images/logoReal.png",
                                width: 40,
                                height: 42,
                              ),
                            )),
                        WidgetSpan(
                            child: Container(
                          margin: EdgeInsets.only(left: 14.0, top: 10),
                          child: Text(
                            "Real estate payments",
                            style: TextStyle(fontSize: 29),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: _buildPaymentsCardList(),
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

  _buildPaymentsCardList() {
    if (data == null) {
      return [Text("Loading...")];
    }
    if (data.length == 0) {
      return [Text("You have not made any payments yet.")];
    }

    List<Widget> list = data
        .map(
          (x) => Container(
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
                    SizedBox(
                      height: 100.00,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Reciever : Real estate market",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Date : ${DateFormat().format(x.transactionDate)}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Amount : \$${x.amount}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
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
