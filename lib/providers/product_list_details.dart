import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/repo/product_details_repo.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier{
  bool isloading=false;
  Product productDetails=Product();
  final productDetailsProviders=ProductDetailsRepo();
  Future<void> productDetailsProvider(int idmethod)async{
    isloading=true;
    notifyListeners();
    final productDetail=await productDetailsProviders.getProductDetails(idmethod);
    productDetails=productDetail!;
    isloading=false;
    notifyListeners();
  }
}


