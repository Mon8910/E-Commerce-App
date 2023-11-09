import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/repo/product_list_repo.dart';
import 'package:flutter/material.dart';

class ProductOccaisons extends ChangeNotifier {
  bool isloading = false;
  List<Product> productList = [];
  final productListRepo = ProductListRepo();
  Future<void> productListsProvider(int idmethod) async {
    isloading = true;
    notifyListeners();
    final listProduct = await productListRepo.productList(idmethod);
    productList = listProduct!;
    isloading = false;
    notifyListeners();
  }
}
