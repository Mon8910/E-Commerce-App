import 'dart:convert';

import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/services/products_details_services.dart';

class ProductsDetailsRepo{
  final productDetailsServices=ProductsDetailsServices();
  Future<ProductModels?> getProductsDetailsRepo(int productDetailsId)async{
    final response=await productDetailsServices.productsDetails(productDetailsId);
    if(response.statusCode==200){
      final Map<String,dynamic>extractedData=json.decode(response.body);
      final productsDetails=extractedData['data']['product'];
      final productsDetail=ProductModels.fromJson(productsDetails);
      return productsDetail;

     
    }
    else{
      return null;
    }
  }
}