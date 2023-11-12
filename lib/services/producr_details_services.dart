import 'package:demo_project/constants/api_endpoints.dart';
import 'package:http/http.dart' as http;


import 'package:demo_project/constants/constantvar.dart';

class ProductDetailsServices {
  Future<http.Response> productDetailsServices(int idmethod) async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}${Appurl.productDetails}$idmethod'));
    return response;
  }
}