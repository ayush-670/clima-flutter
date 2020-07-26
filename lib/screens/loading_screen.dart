import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './getLocation.dart';

const weatherApi = '810a0b49a34bdc48a5904d17fb13eceb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    GetLocation location = GetLocation();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$weatherApi&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.amber,
          size: 70.0,
        ),
      ),
    );
  }
}
