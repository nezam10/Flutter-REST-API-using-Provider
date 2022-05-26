import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_rest_api/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../model_class/user_info.dart';

class ApiService {

  //use this method
  Future<jsonModel> getUsers2()async {
    jsonModel? result;
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.endUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    final item = jsonDecode(response.body);
    result = jsonModel.fromJson(item);
    print("test${result.toString()}");
    return result;
  }

  //this is extra method
  Future<List<jsonModel>?> getUsers()async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endUrl);
      var response = await http.get(url);
      if(response.statusCode == 200){
        final item = jsonDecode(response.body);
        print("asdf"+item.toString());
        List<jsonModel> userList = userModelFromJson(response.body);
        return userList;
      }
    }catch (e) {
      log(e.toString());
    }
    return null;
  }

}








// Future<jsonModel> getUsers2()async {
//   jsonModel? result;
//   var url = Uri.parse("https://randomuser.me/api/?results=10");
//
//   var response = await http.get(url);
//   //print(url);
//   //List<jsonModel> userList = userModelFromJson(response.body);
//   final item = jsonDecode(response.body);
//   print(item);
//   result = jsonModel.fromJson(item);
//   //print(result);
//
//   return result;
// }