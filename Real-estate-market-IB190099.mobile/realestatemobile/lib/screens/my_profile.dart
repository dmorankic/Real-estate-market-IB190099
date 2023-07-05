// ignore_for_file: use_build_context_synchronously, unused_local_variable, unnecessary_new, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/screens/search_ads.dart';
import 'package:realestatemobile/utils/util.dart';
import '../model/patch_object.dart';
import '../model/user.dart';
import '../providers/user_provider.dart';
import 'login_screen.dart';
import 'date_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_use_build_context_synchronous

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  static const String routeName = "/myProfile";
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _formKey = GlobalKey<FormState>();
  late UserProvider _userProvider;

  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dateRegisteredController = TextEditingController();

  DateTime tmpDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    dateController.text = "";
    populateForm();
  }

  validatePhoneNumber(String? number) {
    String patttern = r'(^\d{3}\s\d{8,9}$)';
    RegExp regExp = new RegExp(patttern);
    if (number == null || number.length == 0) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(number)) {
      return 'Phone format should be 387 61222333(3)';
    }
    return null;
  }

  validateZIPcode(String? zip) {
    String patttern = r'(^\d{5}$)';
    RegExp regExp = new RegExp(patttern);
    if (zip == null || zip.length == 0) {
      return 'Please enter ZIP code';
    } else if (!regExp.hasMatch(zip)) {
      return 'ZIP code must have exactly 5 digits';
    }
    return null;
  }

  String selectedValue = "Male";
  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 8),
                    alignment: Alignment.topLeft,
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
                              "My profile",
                              style: TextStyle(fontSize: 29),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "First name:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(height: 0.8),
                                  controller: firstNameController,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter first name (min 3 characters)';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "First name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Last name:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: lastNameController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter last name (min 3 characters)';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Last name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: emailController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !EmailValidator.validate(value)) {
                                      return 'Please enter valid email address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: phoneController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    return validatePhoneNumber(value!);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone number",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "City:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: cityController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter city name (min 3 characters)';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "City",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Street:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: streetController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter street and number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Sreet and number",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ZIP code:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  controller: zipController,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.black),
                                  validator: (value) {
                                    return validateZIPcode(value);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "ZIP code",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date of birth:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                height: 45,
                                child: TextFormField(
                                    controller: dateController,
                                    validator: (value) {
                                      if (value == null || value.length == 0) {
                                        return 'Please enter birth date';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        icon: Icon(Icons.calendar_today),
                                        hintText: "Date of birth"),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: tmpDate,
                                              firstDate: DateTime(1920),
                                              lastDate: DateTime(2101));
                                      setState(() {
                                        dateController.text =
                                            pickedDate.toString();
                                      });
                                      if (pickedDate != null) {
                                        tmpDate = pickedDate;
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                      } else {
                                        print("Date is not selected");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gender:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: SizedBox(
                                width: 200,
                                height: 45,
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return 'Please select gender';
                                    }
                                    return null;
                                  },
                                  items: _createList(),
                                  hint: Text("Select gender"),
                                  value: selectedItem,
                                  isExpanded: true,
                                  onChanged: (String? value) => {
                                    setState(() {
                                      genderController.text = value!;
                                      selectedItem = value ?? "";
                                    })
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Registered:",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: SizedBox(
                                width: 200,
                                height: 45,
                                child: TextFormField(
                                  controller: dateRegisteredController,
                                  validator: (value) {
                                    if (value == null || value.length == 0) {
                                      return 'Please enter birth date';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      hintText: "Date registered"),
                                  readOnly: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ]),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              try {
                                var response = await updateUser();
                                var addressResponse = await updateUserAddress();
                                if (response.statusCode == 200 &&
                                    addressResponse.statusCode == 200) {
                                  var userDecoded = jsonDecode(response.body);
                                  User user = User.fromJson(userDecoded);
                                  Authorization.loggedUser = user;
                                  Authorization.username = user.userName;
                                  Authorization.password =
                                      passwordController.text;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text("Profile update"),
                                            content: Text(
                                                "You have successfully updated your profile"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Ok"))
                                            ],
                                          ));
                                }
                              } on Exception catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("An error occured"),
                                          content: Text(e.toString()),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Ok"))
                                          ],
                                        ));
                              }
                            }
                          },
                          child: Text('Save changes'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Response> updateUser() async {
    List<PatchObject> updateReq = [
      PatchObject(
          path: "/FirstName", op: "replace", value: firstNameController.text),
      new PatchObject(
          path: "/LastName", op: "replace", value: lastNameController.text),
      new PatchObject(
          path: "/Email", op: "replace", value: emailController.text),
      new PatchObject(
          path: "/Phone", op: "replace", value: phoneController.text),
      new PatchObject(
          path: "/DateOfBirth", op: "replace", value: dateController.text),
      new PatchObject(
          path: "/Gender", op: "replace", value: genderController.text)
    ];
    var response =
        await _userProvider.update(updateReq, Authorization.loggedUser!.id!);

    return response;
  }

  Future<Response> updateUserAddress() async {
    Map<String, String> body = {
      "citytName": cityController.text,
      "numberStreet": streetController.text,
      "zipCode": zipController.text
    };

    var response =
        await _userProvider.updateAddress(body, Authorization.loggedUser!.id!);
    return response;
  }

  void populateForm() {
    User user = Authorization.loggedUser!;
    firstNameController.text = user.firstName!;
    lastNameController.text = user.lastName!;
    emailController.text = user.email!;
    phoneController.text = user.phone!;
    dateController.text = user.dateOfBirth!.toString();
    genderController.text = user.gender!;
    dateRegisteredController.text = user.dateRegistered!.toString();
    cityController.text = user.address!.city!.name!;
    streetController.text = user.address!.numberStreet!;
    zipController.text = user.address!.city!.zipCode!;
    setState(() {
      selectedItem = user.gender!;
    });
  }
}

String? selectedItem;
final list = ["Male", "Female"];
List<DropdownMenuItem<String>> _createList() {
  return list
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
