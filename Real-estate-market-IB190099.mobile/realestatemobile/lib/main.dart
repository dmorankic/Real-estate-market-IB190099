// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/providers/advertise_provider.dart';
import 'package:realestatemobile/providers/user_provider.dart';
import 'package:realestatemobile/screens/advertise_details.dart';
import 'package:realestatemobile/screens/burger.dart';
import 'package:realestatemobile/screens/login_screen.dart';
import 'package:realestatemobile/screens/rent.dart';
import 'package:realestatemobile/screens/sale.dart';
import 'package:realestatemobile/screens/saved_ads.dart';
import 'package:realestatemobile/screens/search_ads.dart';

import 'screens/date_picker.dart';
import 'screens/register_screen.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AdvertiseProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
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
                return MaterialPageRoute(
                    builder: ((context) => DatePickerApp()));
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

              var uri = Uri.parse(settings.name!);
              if (uri.pathSegments.length == 2 &&
                  "/${uri.pathSegments.first}" == AdvertiseDetails.routeName) {
                var id = uri.pathSegments[1];
                return MaterialPageRoute(
                    builder: (context) => AdvertiseDetails(id: id));
              }
            }));
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
                image: AssetImage("assets/images/logo.png"),
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
