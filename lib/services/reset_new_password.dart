import 'dart:convert';

import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class ResetNewPasswordServices {
  Future<http.Response> resetPassword(
      {required String password, required String confermtionPassword}) async {
    Map<String, dynamic> body = {
      "user": {
        "country_code": "+20",
        "phone_number": '01274863145',
        "password": password,
        "password_confirmation": confermtionPassword
      },
      "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "{{fcm_token}}"
      }
    };
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Timezone': 'time_zone',
      'Accept-Language': 'language',
      'verification-token':
          'eyJhbGciOiJIUzI1NiJ9.eyJvdHAiOiIwNDk4ODkiLCJjb25maXJtYXRpb25fZGF0ZSI6IjIwMjMtMDYtMDFUMTY6MDc6NTUrMDM6MDAiLCJjb3VudHJ5X2NvZGUiOiIyMCIsInBob25lX251bWJlciI6IjExMTI0MzgyMzMiLCJjb2RlX3Njb3BlIjoicmVzZXRfcGFzc3dvcmQiLCJleHAiOjQ4NDEzMjAwNzV9.sIWdT6ND6lpZiJLokQZDThP7PLwRuhEtZvXeac73nV4'
    };
    final http.Response response = await http.post(
        Uri.parse('${Einveromevt.baseurl}${Appurl.resetNewPassword}'),
        body: jsonEncode(body),
        headers: headers);
    return response;
  }
}
