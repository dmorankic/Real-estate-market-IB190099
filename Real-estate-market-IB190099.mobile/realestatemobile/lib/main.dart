// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:realestatemobile/providers/demand_advertise_provider.dart';
import 'package:realestatemobile/providers/demand_message_provider.dart';
import 'package:realestatemobile/providers/message_provider.dart';
import 'package:realestatemobile/providers/local_image_provider.dart';
import 'package:realestatemobile/providers/payment_provider.dart';
import 'package:realestatemobile/providers/rating_provider.dart';
import 'package:realestatemobile/providers/user_provider.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/screens/create_ad.dart';
import 'package:realestatemobile/screens/demand.dart';
import 'package:realestatemobile/screens/demand_advertise_details.dart';
import 'package:realestatemobile/screens/demand_inbox_details.dart';
import 'package:realestatemobile/screens/inbox.dart';
import 'package:realestatemobile/screens/inbox_details.dart';
import 'package:realestatemobile/screens/login_screen.dart';
import 'package:realestatemobile/screens/my_profile.dart';
import 'package:realestatemobile/screens/payment_list.dart';
import 'package:realestatemobile/screens/rent.dart';
import 'package:realestatemobile/screens/sale.dart';
import 'package:realestatemobile/screens/saved_ads.dart';
import 'package:realestatemobile/screens/search_ads.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:realestatemobile/screens/stripe_payment.dart';
import 'screens/date_picker.dart';
import 'screens/register_screen.dart';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// ignore_for_file: prefer_const_constructors
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey =
        "pk_test_51N5P5eJpQ0wElC71IztGKauTzDKan8TuHCZ2CRZHj64pGPtXRT2RD1A12bgAzSh2gPkpT8iuEM6xpQX9amI3SRNH00NdqlK7bi";
    Stripe.instance.applySettings();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AdvertiseProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => MessageProvider()),
          ChangeNotifierProvider(create: (_) => LocalImageProvider()),
          ChangeNotifierProvider(create: (_) => PaymentProvider()),
          ChangeNotifierProvider(create: (_) => DemandMessageProvider()),
          ChangeNotifierProvider(create: (_) => DemandAdvertiseProvider()),
          ChangeNotifierProvider(create: (_) => RatingProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(title: 'Flutter Demo Home Page'),
          onGenerateRoute: (settings) {
            if (settings.name == Login.routeName) {
              return MaterialPageRoute(builder: ((context) => Login()));
            }
            if (settings.name == Register.routeName) {
              return MaterialPageRoute(builder: ((context) => Register()));
            }
            if (settings.name == DatePickerApp.routeName) {
              return MaterialPageRoute(builder: ((context) => DatePickerApp()));
            }
            if (settings.name == SearchAds.routeName) {
              return MaterialPageRoute(builder: ((context) => SearchAds()));
            }
            if (settings.name == Rent.routeName) {
              return MaterialPageRoute(builder: ((context) => Rent()));
            }
            if (settings.name == Sale.routeName) {
              return MaterialPageRoute(builder: ((context) => Sale()));
            }
            if (settings.name == BurgerMenu.routeName) {
              return MaterialPageRoute(builder: ((context) => BurgerMenu()));
            }
            if (settings.name == SavedAds.routeName) {
              return MaterialPageRoute(builder: ((context) => SavedAds()));
            }
            if (settings.name == Demand.routeName) {
              return MaterialPageRoute(builder: ((context) => Demand()));
            }
            if (settings.name == MyProfile.routeName) {
              return MaterialPageRoute(builder: ((context) => MyProfile()));
            }
            if (settings.name == Inbox.routeName) {
              return MaterialPageRoute(builder: ((context) => Inbox()));
            }
            if (settings.name == InboxDetails.routeName) {
              return MaterialPageRoute(builder: ((context) => InboxDetails()));
            }
            if (settings.name == CreateAd.routeName) {
              return MaterialPageRoute(
                  maintainState: false, builder: ((context) => CreateAd()));
            }
            if (settings.name == PaymentList.routeName) {
              return MaterialPageRoute(builder: ((context) => PaymentList()));
            }

            var uri = Uri.parse(settings.name!);
            if (uri.pathSegments.length == 2 &&
                "/${uri.pathSegments.first}" == AdvertiseDetails.routeName) {
              var id = uri.pathSegments[1];
              return MaterialPageRoute(
                  builder: (context) => AdvertiseDetails(id: id));
            }

            if (uri.pathSegments.length == 2 &&
                "/${uri.pathSegments.first}" ==
                    DemandAdvertiseDetails.routeName) {
              var id = uri.pathSegments[1];
              return MaterialPageRoute(
                  builder: (context) => DemandAdvertiseDetails(id: id));
            }

            if (uri.pathSegments.length == 2 &&
                "/${uri.pathSegments.first}" == InboxDetails.routeName) {
              var id = uri.pathSegments[1];
              return MaterialPageRoute(
                  builder: (context) => InboxDetails(id: id));
            }

            if (uri.pathSegments.length == 2 &&
                "/${uri.pathSegments.first}" == DemandInboxDetails.routeName) {
              var id = uri.pathSegments[1];
              return MaterialPageRoute(
                  builder: (context) => DemandInboxDetails(id: id));
            }

            if (uri.pathSegments.length == 4 &&
                "/${uri.pathSegments.first}" == StripePayment.routeName) {
              var totalPrice = double.tryParse(uri.pathSegments[1]);
              var advertiseId = int.tryParse(uri.pathSegments[2]);
              var employeeId = int.tryParse(uri.pathSegments[3]);

              return MaterialPageRoute(
                  builder: (context) => StripePayment(
                      totalPrice: totalPrice,
                      advertiseId: advertiseId,
                      employeeId: employeeId));
            }
          },
          theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.27),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/logoReal.png"),
              )),
            ),
            SizedBox(height: 40),
            Text(
              'Real estate market',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 70),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                    child: Text('Register'),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button 3 press
                      Navigator.pushNamed(context, SearchAds.routeName);
                    },
                    child: Text('Continue unregistered'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
