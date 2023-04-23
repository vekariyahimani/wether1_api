import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wether1_api/screen/wether/modal/wether_modal.dart';
import 'package:wether1_api/utils/api_helper.dart';

class WetherProvider extends ChangeNotifier
{
  TextEditingController txtcity = TextEditingController(text: 'surat');
  Future<Wether?> getApi()
  async {
    ApiHelper a1=ApiHelper();
   Wether wether= await a1.wetherApiCall(txtcity.text);
   return wether;
  }

}