// ignore_for_file: use_build_context_synchronously, unused_local_variable, unnecessary_new, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/screens/search_ads.dart';
import 'package:realestatemobile/utils/util.dart';
import '../model/user.dart';
import '../providers/user_provider.dart';
import 'login_screen.dart';
import 'date_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';
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
  final _genderKey = GlobalKey<FormFieldState>();
  String? selectedGender;

  DateTime tmpDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  validatePhoneNumber(String? number) {
    String patttern = r'(^\d{3}\s\d{8,9}$)';
    RegExp regExp = new RegExp(patttern);
    if (number == null || number.isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(number)) {
      return 'Phone format should be 387 61222333(3)';
    }
    return null;
  }

  validateZIPcode(String? zip) {
    String patttern = r'(^\d{5}$)';
    RegExp regExp = new RegExp(patttern);
    if (zip == null || zip.isEmpty) {
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
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
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
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: firstNameController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'Please enter first name (min 3 characters)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "First name",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: lastNameController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'Please enter last name (min 3 characters)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Last name",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !EmailValidator.validate(value)) {
                              return 'Please enter valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            return validatePhoneNumber(value!);
                          },
                          decoration: InputDecoration(
                            labelText: "Phone number",
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: cityController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'Please enter city name (min 3 characters)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "City",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: streetController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'Please enter street and number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Street and number",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: zipController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            return validateZIPcode(value);
                          },
                          decoration: InputDecoration(
                            labelText: "ZIP Code",
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 270,
                        child: TextFormField(
                            controller: dateController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter birth date';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Date of birth"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: tmpDate,
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime(2101));
                              setState(() {
                                dateController.text = pickedDate.toString();
                              });
                              if (pickedDate != null) {
                                tmpDate = pickedDate;
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                              }
                            }),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 290,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: DropdownButtonFormField<String>(
                              key: _genderKey,
                              hint: const Text("Select gender"),
                              isExpanded: true,
                              value: selectedGender,
                              elevation: 16,
                              onChanged: (String? value) {
                                _genderKey.currentState!.validate();

                                setState(() {
                                  genderController.text = value ?? "";
                                  selectedGender = value ?? "";
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select gender';
                                }
                                return null;
                              },
                              items: _createList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: passwordController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 5) {
                              return 'Please enter password (min 5 characters)';
                            }
                            return null;
                          },
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          style: TextStyle(
                              fontSize: 15.0, height: 1, color: Colors.black),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value != passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            isDense: true,
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              var response = await registerNewUser();
                              if (response.statusCode == 200) {
                                var userDecoded = jsonDecode(response.body);
                                User user = User.fromJson(userDecoded);
                                Authorization.loggedUser = user;
                                Authorization.username = user.username;
                                Authorization.password =
                                    passwordController.text;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("Registration"),
                                          content: Text(
                                              "You have successfully registered, click ok to continue to application"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushNamed(context,
                                                      SearchAds.routeName);
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
                          }
                        },
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
      ),
    );
  }

  bool passwordMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  Future<Response> registerNewUser() async {
    Map<String, String> user = {
      "firstName": firstNameController.text,
      "username":
          "${firstNameController.text.toLowerCase()}.${lastNameController.text.toLowerCase()}",
      "password": passwordController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "dateOfBirth": dateController.text,
      "gender": selectedGender!,
      "numberStreet": streetController.text,
      "city": cityController.text,
      "zipCode": zipController.text
    };
    var response = await _userProvider.register(user);

    return response;
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
