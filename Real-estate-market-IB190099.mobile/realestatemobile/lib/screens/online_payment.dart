// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class OnlinePayment extends StatefulWidget {
  const OnlinePayment({super.key});
  static const String routeName = "/online-payment";

  @override
  State<OnlinePayment> createState() => _OnlinePaymentState();
}

class _OnlinePaymentState extends State<OnlinePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardFormField(
                controller: CardFormEditController(),
              ),
              SizedBox(
                height: 15,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.payment))
            ],
          ),
        ),
      ),
    );
  }
}
