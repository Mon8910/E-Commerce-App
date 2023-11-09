import 'package:http/http.dart' as http;
import 'package:demo_project/constants/constantvar.dart';

class ProductListServices {
  Future<http.Response> productListType(int idmethod) async {
    final response = await http
        .get(Uri.parse('${Einveromevt.baseurl}/products?occasion_type_id=$idmethod'));
    return response;
  }
}