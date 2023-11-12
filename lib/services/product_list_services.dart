import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/constants/constantvar.dart';
import 'package:http/http.dart' as http;

class ProductListServices {
  Future<http.Response> productListType(int idmethod) async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}${Appurl.productOccasionType}$idmethod'));
    return response;
  }
}