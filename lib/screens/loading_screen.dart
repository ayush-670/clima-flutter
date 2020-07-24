import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import './getLocation.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLocation location = GetLocation();
    await location.getCurrentLocation();
    print(location.lat);
    print(location.long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
