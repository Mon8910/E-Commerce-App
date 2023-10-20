import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {

  bool _isloading = false;
  String _resmessage = '';
  bool get isloading => _isloading;
  String get resmessage => _resmessage;
  void loginuser(
      {
      required String password,
      required String passwordconfermation,
     required BuildContext context}) async {
    _isloading = true;
    notifyListeners();
    final body = {
    "user": {
        "country_code": "+20",
        "phone_number": "1274863145",
        "password": password,
        "password_confirmation": passwordconfermation
    },
    "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "{{fcm_token}}"
    }
};
    print(body);
    try {
      final url= Uri.parse(Appurl.resetnewpassword);
      http.Response res =
          await http.post(url, body: json.encode(body), headers: {
        'Content-Type': 'application/json',
        'Timezone': 'time_zone',
        'Accept-Language': 'language',
        'Cookie':'__profilin=p%3Dt',
        'Postman-Token':'<calculated when request is sent>',
        'Host':'<calculated when request is sent>',
        'User-Agent':'PostmanRuntime/7.33.0',
        'Accept':'*/*',
        'Accept-Encoding':'gzip, deflate, br',
        'Connection':'keep-alive',
        'verification-token':'eyJhbGciOiJIUzI1NiJ9.eyJvdHAiOiIyODUwMTAiLCJjb25maXJtYXRpb25fZGF0ZSI6IjIwMjMtMDEtMThUMTg6MDE6MDMrMDI6MDAiLCJjb3VudHJ5X2NvZGUiOm51bGwsInBob25lX251bWJlciI6IjExNTkzMDk5NjYiLCJjb2RlX3Njb3BlIjoicmVzZXRfcGFzc3dvcmQiLCJleHAiOjQ4Mjk3NTI4NjN9.71UzzWYa7o6IEgQP7t5sBPGv0jHfYmjZTNakhQzkqr0'

      });
      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);

        log("---------------------------${req}",name: "Sucess");
        
        _isloading = false;
        _resmessage = 'true';
        notifyListeners();
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const Login()),
        );
      } else {
        final req = json.decode(res.body);
        log("==============$req",name: "Error");
        _isloading = false;
        _resmessage = 'error';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;
      _resmessage = 'internet connection is not avaliable';
      notifyListeners();
    } catch (e) {
      _isloading = false;
      _resmessage = 'please try again';
      notifyListeners();
    }
  }

  void clear() {
    _resmessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
