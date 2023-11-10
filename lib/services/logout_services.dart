import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class LogoutServices {
  Future<http.Response> logout() async {
    Map<String, String>? headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Accept-Language": 'en',
    };
    final http.Response response = await http.delete(
        Uri.parse('${Einveromevt.baseurl}${Appurl.logOut}'),
        headers: headers);
        print('dddddd=========${response.body}');
        return response;
        // print(response);
  }
}
