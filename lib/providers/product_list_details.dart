import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/repo/product_details_repo.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier{
 bool _isloading=false;
  bool get isloading=>_isloading;
  void setIsloading(bool val){
    _isloading=val;
    notifyListeners();
  }
  Product productDetails=Product();
  final productDetailsRepo=ProductDetailsRepo();
  
   void updateProductDetails(Product value){
    productDetails=value;
    notifyListeners();
   }
  
}


