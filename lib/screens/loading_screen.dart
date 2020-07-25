import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './getLocation.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLocation location = GetLocation();
    await location.getCurrentLocation();
    print(location.lat);
    print(location.long);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      String data;
      data = response.body;

       var longitude= jsonDecode(data)['coord']['lon'];


      print(longitude);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
