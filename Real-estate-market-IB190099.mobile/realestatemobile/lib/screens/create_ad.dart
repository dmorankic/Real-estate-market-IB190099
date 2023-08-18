// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/util.dart';
import 'burger.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({super.key});
  static const String routeName = "/create-ad";

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController adSectionController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController quadratureController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController floorsController = TextEditingController();
  TextEditingController propTypeController = TextEditingController();
  TextEditingController roomsController = TextEditingController();
  TextEditingController yearConstController = TextEditingController();
  bool? parking = false;
  bool? water = false;
  bool? electricity = false;

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
                                "assets/images/logo.png",
                                width: 40,
                                height: 42,
                              ),
                            )),
                        WidgetSpan(
                            child: Container(
                          margin: EdgeInsets.only(left: 14.0, top: 10),
                          child: Text(
                            "Create ad request",
                            style: TextStyle(fontSize: 29),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                height: 45,
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select advertise section';
                                    }
                                    return null;
                                  },
                                  items: _getAdSections(),
                                  hint: Text("Select advertise section"),
                                  value: selectedAdSection,
                                  isExpanded: true,
                                  onChanged: (String? value) => {
                                    setState(() {
                                      adSectionController.text = value!;
                                      selectedAdSection = value ?? "";
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                height: 150,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'You did not insert message';
                                      }
                                      return null;
                                    },
                                    controller: descController,
                                    maxLines: 8,
                                    decoration: InputDecoration(
                                        hintText: "Type description here...")),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: quadratureController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter quadrature';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Quadrature in m²",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: addressController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter address of your property';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Address of your property",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: floorsController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter number of floors';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Number of floors",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                height: 45,
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select property type';
                                    }
                                    return null;
                                  },
                                  items: _getPropTypes(),
                                  hint: Text("Select property type"),
                                  value: selectedPropType,
                                  isExpanded: true,
                                  onChanged: (String? value) => {
                                    setState(() {
                                      propTypeController.text = value!;
                                      selectedPropType = value ?? "";
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: roomsController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter number of rooms';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Number of rooms",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: yearConstController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter year of construction';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Year of construction",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Parking"),
                                    Checkbox(
                                      value: parking,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          parking = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Water"),
                                    Checkbox(
                                      value: water,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          water = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 250,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Electricity"),
                                    Checkbox(
                                      value: electricity,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          electricity = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  // var response = await registerNewUser();
                                  // if (response.statusCode == 200) {
                                  //   var userDecoded = jsonDecode(response.body);
                                  //   User user = User.fromJson(userDecoded);
                                  //   Authorization.loggedUser = user;
                                  //   Authorization.username = user.userName;
                                  //   Authorization.password =
                                  //       passwordController.text;
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (BuildContext context) =>
                                  //           AlertDialog(
                                  //             title: Text("Registration"),
                                  //             content: Text(
                                  //                 "You have successfully registered, click ok to continue to application"),
                                  //             actions: [
                                  //               ElevatedButton(
                                  //                   onPressed: () {
                                  //                     Navigator.pop(context);
                                  //                     Navigator.pushNamed(
                                  //                         context,
                                  //                         SearchAds.routeName);
                                  //                   },
                                  //                   child: Text("Ok"))
                                  //             ],
                                  //           ));
                                  // }
                                }
                              },
                              child: Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? selectedAdSection;

final adSectionList = ["Rent", "Sale", "Demand"];
List<DropdownMenuItem<String>> _getAdSections() {
  return adSectionList
      .map<DropdownMenuItem<String>>(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
          ),
        ),
      )
      .toList();
}

String? selectedPropType;

final propTypesList = ["House", "Flat", "Office space", "Hall", "Cottage"];
List<DropdownMenuItem<String>> _getPropTypes() {
  return propTypesList
      .map<DropdownMenuItem<String>>(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
          ),
        ),
      )
      .toList();
}
