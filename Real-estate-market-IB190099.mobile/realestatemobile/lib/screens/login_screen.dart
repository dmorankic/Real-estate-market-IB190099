// ignore_for_file: prefer_final_fields, unused_field, sized_box_for_whitespace, empty_catches, unused_catch_clause, use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/screens/register_screen.dart';
import 'package:realestatemobile/screens/search_ads.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/user.dart';
import '../providers/user_provider.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )),
              ),
              SizedBox(height: 17),
              Text(
                'Real estate market',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 70),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pasword",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment(0.55, 0.01),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          Authorization.username = _usernameController.text;
                          Authorization.password = _passwordController.text;
                          List<User> users =
                              await _userProvider.get({}, "User");
                          users.forEach((element) {
                            if (element.userName == Authorization.username) {
                              Authorization.loggedUser = element;
                            }
                          });
                          Navigator.pop(context);
                          Navigator.popAndPushNamed(
                              context, SearchAds.routeName);
                        } on Exception catch (e) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text("Error"),
                                    content: Text(e.toString()),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Ok"))
                                    ],
                                  ));
                        }
                      },
                      child: Text('Log in'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
