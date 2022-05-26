
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/api_helper/api_service.dart';
import 'package:flutter_rest_api/model_class/user_info.dart';

class ProviderClass extends ChangeNotifier{
  List<jsonModel>? userInfoList = [];
  jsonModel? userinfo;

  void getData() async {
    userInfoList = (await ApiService().getUsers());
    notifyListeners();
  }

  //use this method
   void getData2() async {
    userinfo = (await ApiService().getUsers2());
    notifyListeners();
   }
}