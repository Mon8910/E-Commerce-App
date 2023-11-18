import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/repo/product_list_repo.dart';
import 'package:flutter/material.dart';

class ProductOccaisonsProvider extends ChangeNotifier {
  bool _isloading=false;
  bool get isloading=>_isloading;
  void setIsloading(bool val){
    _isloading=val;
    notifyListeners();
  }
  List<Product> productList = [];
  final productListRepo = ProductListRepo();
  void updateProductList(List<Product> value){
    productList=value;
    notifyListeners();
    
  }

 
}
