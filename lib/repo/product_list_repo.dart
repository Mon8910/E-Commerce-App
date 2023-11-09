import 'dart:convert';

import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/services/product_list_services.dart';

class ProductListRepo{
  final productListServices=ProductListServices();
  Future<List<Product>?> productList(int idmethod)async{
    final response=await productListServices.productListType(idmethod);
    if(response.statusCode==200){
      final Map<String,dynamic> extractedData=json.decode(response.body);
      print('the list of product is ${response.body}');
      final productList=extractedData['data']['products'];
      final List<Product> productLists=Product.productList(productList);
      return productLists;

    }
    else{
      return null;
    }
  }
}