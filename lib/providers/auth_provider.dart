import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/screens/navigator_bar.dart';
import 'package:demo_project/screens/ocaiaonss.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {

  bool _isloading = false;
  String _resmessage = '';
  bool get isloading => _isloading;
  String get resmessage => _resmessage;
  void loginuser(
      {required String phone,
      required String password,
      required String code,
     required BuildContext context}) async {
    _isloading = true;
    notifyListeners();
    final body = {
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
    print(body);
    try {
      final url= Uri.parse(Appurl.loginurl);
      http.Response res =
          await http.post(url, body: json.encode(body), headers: {
        'Content-Type': 'application/json',
        'Timezone': 'time_zone',
        'Accept-Language': 'language'
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
          MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
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
