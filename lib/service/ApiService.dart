import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled2/model/User.dart';

class ApiService {

  static Map<String, String> paramsEmpty(){
    Map<String,String> params = {};
    return params;
  }


  static const String BASE = "api.github.com";
  static const String USER = "/users";
  static String NAME = "xoliqov-md";



  // static const String BASE = "jsonplaceholder.typicode.com";
  // static const String USER = "/posts";

  static Future<User?> GET(String api) async {
    var q = Uri.https(BASE, "${USER}/${NAME}",paramsEmpty());
    var response = await get(q);

    print(response.body);

    if (response.statusCode == 200) {
      dynamic j = jsonDecode(response.body);
      return User.fromJson(j);
    }
  }

}
