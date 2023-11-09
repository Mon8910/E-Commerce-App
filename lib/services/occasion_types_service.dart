import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class OccaionsServices {
  Future<http.Response> occaionsTypes() async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}${Appurl.occaisonsType}'));
    return response;
  }
}
