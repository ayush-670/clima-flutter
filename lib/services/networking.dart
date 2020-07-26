import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import '../screens/getLocation.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data;
      data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

