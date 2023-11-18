import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class OccaionsShowServices {
  Future<http.Response> occaionsTypes(int showOccaionsId) async {
    final response = await http.get(Uri.parse(
        '${Einveromevt.baseurl}${Appurl.showOccasionsType}$showOccaionsId'));
    return response;
  }
}
