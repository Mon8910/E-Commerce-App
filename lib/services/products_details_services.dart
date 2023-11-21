import 'package:demo_project/constants/api_endpoints.dart';
import 'package:http/http.dart' as http;


import 'package:demo_project/constants/constantvar.dart';

class ProductsDetailsServices {
  Future<http.Response> productsDetails(int productDetailsId) async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}${Appurl.productDetails}$productDetailsId'));
    return response;
  }
}