import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wether1_api/screen/wether/modal/wether_modal.dart';

class ApiHelper
{
  Future<Wether> wetherApiCall(String city)
  async {
    String link="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=700a82db0ba46cd5cf421c367b2b02ce";
    Uri uri=Uri.parse(link);
    var response=await http.get(uri);
    var json=jsonDecode(response.body);

    Wether? wether =Wether.fromJson(json);
    return wether;

  }
}

