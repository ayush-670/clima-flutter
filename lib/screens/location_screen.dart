import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int nul;
  String weatherIcon;
  String message;
  int temperature;
  int condition;
  String cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        nul = 0;
        weatherIcon = 'Error';
        message = ' Unable to fetch data';
        cityName = '';
        return;
      } else {
        int temp = weatherData['main']['temp'];
        nul = temp;
        temperature = temp.toInt();

        message = weather.getMessage(temp);

        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);

        cityName = weatherData['name'];
        print('$temp is thetemp');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$nul°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  double temperature = decodedData['main']['temp'];
//     int id = decodedData['weather'][0]['id'];
//     String city = decodedData['name'];
