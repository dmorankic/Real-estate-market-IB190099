// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../blocs/payment/payment_bloc.dart';

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
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              CardFormEditController cardController = CardFormEditController(
                  initialDetails: state.cardFieldInputDetails);
              if (state.status == PaymentStatus.initial) {
                return Column(
                  children: [
                    CardFormField(
                      controller: cardController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          (cardController.details.complete)
                              ? context.read<PaymentBloc>().add(
                                      PaymentCreateIntent(
                                          billingDetails: BillingDetails(
                                              email: 'dtokic@gmail.com'),
                                          items: [
                                        {'id': 0}
                                      ]))
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('The form is not complete')));
                        },
                        icon: Icon(Icons.payment))
                  ],
                );
              } else if (state.status == PaymentStatus.success) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("The payment is successfull"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PaymentBloc>().add(PaymentStart());
                        },
                        child: Text("Go back"))
                  ],
                );
              } else if (state.status == PaymentStatus.failure) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("The payment failed"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PaymentBloc>().add(PaymentStart());
                        },
                        child: Text("Try again"))
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
