// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_screen.dart';
import 'date_picker.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous

class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = "/register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController dateController = TextEditingController();
  DateTime tmpDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  String selectedValue = "Male";
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
                    top: MediaQuery.of(context).size.height * 0.08),
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
              SizedBox(height: 10),
              Text(
                'Create your account',
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
                            hintText: "First name",
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
                            hintText: "Last name",
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
                            hintText: "Phone number",
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
                            hintText: "Sreet and number",
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
                            hintText: "ZIP code",
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
                        height: 35,
                        child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                hintText: "Date of birth"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: tmpDate,
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                tmpDate = pickedDate;
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                print(formattedDate);

                                setState(() {
                                  dateController.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            }),
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
                        height: 35,
                        child: DropdownButton(
                          items: _createList(),
                          hint: Text("Select gender"),
                          value: selectedItem,
                          isExpanded: true,
                          onChanged: (String? value) => {
                            setState(() {
                              selectedItem = value ?? "";
                            })
                          },
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
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          //controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
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
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          //controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      //color: Color.fromRGBO(0, 0, 255, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                    child: Text(
                      "Log in",
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

String? selectedItem;
final list = ["Male", "Female"];
List<DropdownMenuItem<String>> _createList() {
  return list
      .map<DropdownMenuItem<String>>(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();
}
