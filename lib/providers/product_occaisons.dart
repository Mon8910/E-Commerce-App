import 'dart:convert';
import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/models/ocaisons_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductOccaisons extends ChangeNotifier{
  bool isloading=false;

  List<Product> productdata=[];

  Future<List<Product>> getallData(int idproducts) async {
    isloading=true;
    notifyListeners();
    final url = Uri.parse(
        '${Appurl.occaisonsProducts}occasion_type_id=$idproducts');
    final response = await http.get(url,headers: {
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhYmxlX2lkIjoxNDAsImF1dGhlbnRpY2FibGVfdHlwZSI6IkN1c3RvbWVyIiwiZGV2aWNlIjoxODA3LCJjcmVhdGVkX2F0IjoxNjk3NzIyNDczLCJleHAiOjQ4NTM0MTc2NzN9.7JuPdh79-ZYW-2SRGPnZCoirGcKVT9slqbkeRcdBwQg',
      'Cookie':'__profilin=p%3Dt',
      'Postman-Token':'<calculated when request is sent>',
      'User-Agent':'PostmanRuntime/7.33.0',
      'Accept':'*/*',
      'Accept-Encoding':'gzip, deflate, br',
      'Connection':'keep-alive'
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> listdata = json.decode(response.body);
      print(listdata);
      final extradata = listdata['data']['products'] as List<dynamic>?;
      final List<Product> productlist = [];
      if (extradata != null) {
        for (var i in extradata) {
          productlist.add(Product.fromJson(i));
        }

      }
      productdata=productlist;
      isloading=false;
      notifyListeners();
    }
    

    // throw 'something went wrong';
    return [];
  }
}