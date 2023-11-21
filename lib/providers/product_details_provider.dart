import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/repo/products_details_repo.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  ProductModels productDetails = ProductModels();
  final productDetailsRepo = ProductsDetailsRepo();

  void updateProductDetails(ProductModels value) {
    productDetails = value;
    notifyListeners();
  }
}
