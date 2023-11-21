import 'package:demo_project/models/product_models.dart';
import 'package:demo_project/repo/products_repo.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  List<ProductModels> productList = [];
  final productRepo = ProductsRepo();
  void updateProductList(List<ProductModels> value) {
    productList = value;
    notifyListeners();
  }
}
