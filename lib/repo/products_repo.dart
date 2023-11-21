import 'dart:convert';

import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/services/products_services.dart';

class ProductsRepo{
  final productsServices=ProductsServices();
  Future<List<ProductModels>?> productsRepo(int productId)async{
    final response=await productsServices.products(productId);
    if(response.statusCode==200){
      final Map<String,dynamic> extractedData=json.decode(response.body);
      // print('the list of product is ${response.body}');
      final products=extractedData['data']['products'];
      final List<ProductModels> productsList=ProductModels.productList(products);
      return productsList;

    }
    else{
      return null;
    }
  }
}