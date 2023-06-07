import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                          //controller: _usernameController,
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
                          //controller: _passwordController,
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
              Container(
                  child: Text(
                "Forgot password?",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Login.routeName);
                      },
                      child: Text('Log in'),
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
