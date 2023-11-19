import 'dart:convert';

import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/services/producr_details_services.dart';

class ProductDetailsRepo{
  final productDetailsServices=ProductDetailsServices();
  Future<Product?> getProductDetailsRepo(int productDetailsId)async{
    final response=await productDetailsServices.productDetailsServices(productDetailsId);
    if(response.statusCode==200){
      final Map<String,dynamic>extractedData=json.decode(response.body);
      final productDetails=extractedData['data']['product'];
      final productDetail=Product.fromJson(productDetails);
      return productDetail;

     
    }
    else{
      return null;
    }
  }
}