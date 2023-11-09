import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<http.Response> login(
      {required String phone,
      required String password,
      required String code}) async {
    Map<String, dynamic> body = {
      "user": {
        "country_code": code,
        "phone_number": phone,
        "password": password
      },
      "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "dummy"
      }
    };
    Map<String, String>? headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Accept-Language": 'en',
    };

    final http.Response response = await http.post(
        Uri.parse('${Einveromevt.baseurl}${Appurl.loginUrl}'),
        body: jsonEncode(body),
        headers: headers);
       // print('boddddyd dddninn------${response.body}');
        log(body.toString(),name: "LOGIN-BODY");
    log(response.body,name: "LOGIN-RESPONSE-BODY");
    return response;
  }
}
