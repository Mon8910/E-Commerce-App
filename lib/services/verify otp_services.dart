import 'package:http/http.dart' as http;


class VerifyOtpServices {
  Future<void> verifyOtpServices({required String otp})async{
    Map<String,dynamic>body={
        "verification_code": otp,
    "user": {
        "country_code": "+20",
        "phone_number": "01274863135"
    }
};
Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Timezone': 'time_zone',
        'Accept-Language': 'language'
      };

  }
  

}
// class SendResetPasswordServices {
//   Future<http.Response> sendRestPassword(
//       {required String phone, required String code}) async {
//     Map<String, dynamic> body = {
//       "user": {"country_code": code, "phone_number": phone}
//     };
//     Map<String, String>? headers = {
//         'Content-Type': 'application/json',
//         'Timezone': 'time_zone',
//         'Accept-Language': 'language'
//       };
//     final http.Response response = await http.post(
//         Uri.parse(
//             '${Einveromevt.baseurl}${Appurl.forgetPasswordUrl}'),
//         body:  jsonEncode(body),
//         headers: headers);
//         print(response.body);
//     return response;
//   }
// }
