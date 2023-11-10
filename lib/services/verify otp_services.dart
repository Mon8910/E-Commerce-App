import 'dart:convert';

import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class VerifyOtpServices {
  Future<http.Response> verifyOtpServices({required String otp}) async {
    Map<String, dynamic> body = {
      "verification_code": otp,
      "user": {"country_code": "+20", "phone_number": "01274863135"}
    };
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Timezone': 'time_zone',
      'Accept-Language': 'language'
    };
    final http.Response response = await http.post(
        Uri.parse('${Einveromevt.baseurl}${Appurl.verifyOtp}'),
        body: jsonEncode(body),headers: headers);
        print(response);
        return response;
  }
}
