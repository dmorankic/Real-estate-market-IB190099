// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../providers/payment_provider.dart';
import '../utils/util.dart';

class StripePayment extends StatefulWidget {
  StripePayment(
      {this.totalPrice, this.advertiseId, this.employeeId, super.key});
  double? totalPrice;
  int? advertiseId;
  int? employeeId;

  static const String routeName = "/stripe-payment";

  @override
  State<StripePayment> createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  Map<String, dynamic>? paymentIntentData;
  PaymentProvider? _paymentProvider;

  @override
  void initState() {
    super.initState();
    _paymentProvider = context.read<PaymentProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
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
                                  "assets/images/logoReal.png",
                                  width: 40,
                                  height: 42,
                                ),
                              )),
                          WidgetSpan(
                              child: Container(
                            margin: EdgeInsets.only(left: 14.0, top: 10),
                            child: Text(
                              "Online payment",
                              style: TextStyle(fontSize: 29),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(children: [
                  Text(
                    "To pay \$" + (widget.totalPrice! / 5).toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () async {
                        await makePayment(widget.totalPrice! / 5);
                      },
                      child: Text("Pay"),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(double amount) async {
    try {
      paymentIntentData =
          await createPaymentIntent((amount * 100).round().toString(), 'usd');
      var response = await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              googlePay: PaymentSheetGooglePay(
                  merchantCountryCode: 'BIH', testEnv: true),
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Real estate market',
            ),
          )
          .then((value) {});

      displayPaymentSheet(amount);
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text("Error ocurred"),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
    }
  }

  displayPaymentSheet(double amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().onError((error, stackTrace) {
        throw Exception(error);
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Payment successful")));
      savePaymentInfo(amount);
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Error ocurred"),
                content: Text("Payment canceled!"),
              ));
    } catch (e) {
      print('$e');
    }
  }

  Future<Response> savePaymentInfo(double amount) async {
    Map<String, dynamic> body = {
      "amount": amount,
      "userId": Authorization.loggedUser!.id!.toString(),
      "transactionDate": DateTime.now().toString(),
      "advertiseId": widget.advertiseId,
      "employeeId": widget.employeeId
    };

    var response = await _paymentProvider!.create(body);
    return response;
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51N5P5eJpQ0wElC71JRqDG3Kr2uOOwTRG3DF92uCcHb6SvPSVkhTDkWwkYvS8Op30jTdGCzLrNiuRToHzrGzpprlc00lL4VLUyt',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('Error: ${err.toString()}');
    }
  }
}
