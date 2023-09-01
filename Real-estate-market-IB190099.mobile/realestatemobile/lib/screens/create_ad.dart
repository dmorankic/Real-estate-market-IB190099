// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:realestatemobile/model/advertise.dart';
import 'package:realestatemobile/model/image.dart';
import 'package:realestatemobile/state/image_state.dart';
import '../providers/advertise_provider.dart';
import '../utils/util.dart';
import 'advertise_details.dart';
import 'burger.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../providers/local_image_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({super.key});
  static const String routeName = "/create-ad";

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  XFile? image;
  List _images = [];
  List _imageIds = [];
  double lat = 27.7089427;
  double lon = 85.3086209;

  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _sectionKey = GlobalKey<FormFieldState>();
  final _typeKey = GlobalKey<FormFieldState>();

  late LocalImageProvider _imageProvider;
  AdvertiseProvider? _advertiseProvider = null;
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(44.525555, 18.521741);

  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    if (img != null) {
      setState(() {
        _images.add(img);
      });
    }
  }

  Future getImageServer() async {
    if (_imageProvider != null) {
      Future<Response> response = _imageProvider.getImageFromServer();
      response
          .then((res) => {
                if (res.statusCode == 200)
                  {
                    setState(() {
                      _images = jsonDecode(res.body);
                    })
                  }
              })
          .catchError((err) {
        print('Error: $err');
      }, test: (error) {
        return error is int && error >= 400;
      });
    }
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    super.initState();
  }

  TextEditingController adSectionController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController quadratureController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController numberStreetController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController floorsController = TextEditingController();
  TextEditingController propTypeController = TextEditingController();
  TextEditingController roomsController = TextEditingController();
  TextEditingController yearConstController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool? parking = false;
  bool? water = false;
  bool? electricity = false;
  String? selectedPropType;
  String? selectedAdSection;

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

  @override
  Widget build(BuildContext context) {
    _imageProvider = Provider.of<LocalImageProvider>(context, listen: false);
    _advertiseProvider = Provider.of<AdvertiseProvider>(context, listen: false);
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
                        child: Column(children: [
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              maxLength: 21,
                              controller: nameController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Please enter property name';
                                }
                                if (value.length > 21) {
                                  return 'Property name can not be longer than 21 character';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Property name",
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Advertise Section',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                child: ButtonTheme(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  child: DropdownButtonFormField<String>(
                                    key: _sectionKey,
                                    hint:
                                        const Text("Select advertise section"),
                                    isExpanded: true,
                                    value: selectedAdSection,
                                    elevation: 16,
                                    onChanged: (String? value) {
                                      _sectionKey.currentState!.validate();

                                      setState(() {
                                        adSectionController.text = value ?? "";

                                        selectedAdSection = value ?? "";
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select advertise section';
                                      }
                                      return null;
                                    },
                                    items: _getAdSections(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: 300,
                            height: 150,
                            child: TextFormField(
                              controller: descController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              },
                              maxLines: 8,
                              decoration: InputDecoration(
                                labelText: "Type description here...",
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
                              controller: quadratureController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter quadrature';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Quadrature (m²)",
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
                              controller: cityController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Please enter property city';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Property city",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: numberStreetController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Please enter property street and number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Property street and number",
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
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                return validateZIPcode(value);
                              },
                              decoration: InputDecoration(
                                labelText: "Property zip code",
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
                              controller: floorsController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of floors';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Floors",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Property type',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                child: ButtonTheme(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  child: DropdownButtonFormField<String>(
                                    key: _typeKey,
                                    hint: const Text("Select property type"),
                                    isExpanded: true,
                                    value: selectedPropType,
                                    elevation: 16,
                                    onChanged: (String? value) {
                                      _typeKey.currentState!.validate();

                                      setState(() {
                                        propTypeController.text = value ?? "";
                                        selectedPropType = value ?? "";
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select property type';
                                      }
                                      return null;
                                    },
                                    items: _getPropTypes(),
                                  ),
                                ),
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
                              controller: roomsController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of rooms';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Rooms",
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
                              controller: yearConstController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Please enter year of construction';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Year of construction",
                                // labelStyle: TextStyle(color: Colors.black),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Checkbox(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          parking = value;
                                        });
                                      },
                                      tristate: false,
                                      value: parking,
                                    ),
                                    Text(
                                      'Parking',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Checkbox(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          water = value;
                                        });
                                      },
                                      tristate: false,
                                      value: water,
                                    ),
                                    Text(
                                      'Water',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Checkbox(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          electricity = value;
                                        });
                                      },
                                      tristate: false,
                                      value: electricity,
                                    ),
                                    Text(
                                      'Electricity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
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
                              width: 280,
                              height: 35,
                              child: GestureDetector(
                                onTap: () {
                                  myAlert();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Select photos to upload",
                                    ),
                                    IconButton(
                                      onPressed: () => myAlert(),
                                      icon: Icon(Icons.upload),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height: 300,
                                      child: _images.isNotEmpty
                                          ? GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 10),
                                              itemCount: _images.length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (_, index) {
                                                return Image.file(
                                                    File(_images[index].path));
                                              })
                                          : Center(
                                              child: Text("No images chosen"))),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: priceController,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Please enter the price';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Price",
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: SizedBox(
                              width: 300,
                              height: 200,
                              child: GoogleMap(
                                zoomGesturesEnabled: true,
                                initialCameraPosition: CameraPosition(
                                  target: showLocation,
                                  zoom: 15.0,
                                ),
                                markers: markers,
                                mapType: MapType.normal,
                                onMapCreated: (controller) {
                                  setState(() {
                                    mapController = controller;
                                  });
                                },
                                onTap: (position) {
                                  setState(() {
                                    markers = {};
                                    markers.add(Marker(
                                      markerId:
                                          MarkerId(showLocation.toString()),
                                      position: position,
                                      infoWindow: InfoWindow(
                                        title: 'My Custom Title ',
                                        snippet: 'My Custom Subtitle',
                                      ),
                                      icon: BitmapDescriptor.defaultMarker,
                                    ));
                                    lat = position.latitude;
                                    lon = position.longitude;
                                    mapController?.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: position, zoom: 15.0)));
                                  });
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    if (_images.isNotEmpty) {
                                      for (int i = 0; i < _images.length; i++) {
                                        var res = await _imageProvider
                                            .uploadImage(_images[i].path);

                                        var imgDecoded = jsonDecode(res);
                                        var loadedImg =
                                            LocalImage.fromJson(imgDecoded);
                                        setState(() {
                                          _imageIds.add(loadedImg.id);
                                        });
                                      }
                                    }
                                    var response = await createAdvertise();
                                    if (response.statusCode == 200) {
                                      var advertiseDecoded =
                                          jsonDecode(response.body);
                                      var adv =
                                          Advertise.fromJson(advertiseDecoded);

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title:
                                                    Text("Advertise created"),
                                                content: Text(
                                                    "Advertise created successfully"),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () => {
                                                            Navigator.pop(
                                                                context),
                                                            Navigator.pushNamed(
                                                                context,
                                                                "${AdvertiseDetails.routeName}/${adv.id}")
                                                          },
                                                      child: Text("Ok"))
                                                ],
                                              ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('An error occured')),
                                      );
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
                              child: Text('Create advertise'),
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

  Future<Response> createAdvertise() async {
    Map<String, dynamic> advertise = {
      "Status": "pending",
      "Type": selectedAdSection,
      "Name": nameController.text,
      "Description": descController.text,
      "Floors": int.tryParse(floorsController.text),
      "PropertyType": selectedPropType,
      "Rooms": int.tryParse(roomsController.text),
      "YearOfConstruction": int.tryParse(yearConstController.text),
      "Parking": parking == true ? 1 : 0,
      "Water": water == true ? 1 : 0,
      "Electricity": electricity == true ? 1 : 0,
      "Price": int.tryParse(priceController.text),
      "Quadrature": quadratureController.text,
      "Images": _imageIds,
      "UserId": Authorization.loggedUser?.id,
      "CitytName": cityController.text,
      "NumberStreet": numberStreetController.text,
      "ZipCode": zipController.text,
      "Latitude": lat,
      "Longitude": lon
    };
    var response = await _advertiseProvider!.createAdvertise(advertise);

    return response;
  }
}

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
