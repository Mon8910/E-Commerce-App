import 'dart:convert';

import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordServices {
  Future<http.Response> forgetPassword(
      {required String phone, required String code}) async {
    Map<String, dynamic> body = {
      "user": {"country_code": code, "phone_number": phone}
    };
    Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Timezone': 'time_zone',
        'Accept-Language': 'language'
      };
    final http.Response response = await http.post(
        Uri.parse(
            '${Einveromevt.baseurl}${Appurl.forgetPasswordUrl}'),
        body:  jsonEncode(body),
        headers: headers);
        print(response.body);
    return response;
  }
}
