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



// import 'dart:convert';

// import 'package:demo_project/models/ocaisons_products.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ProductDetailsProvider extends ChangeNotifier{
//   bool isloadingproduct=false;
//   //List<Product> productlists=[];

//    Product productlists=Product();
//    //Currency cy=Currency();

//   Future<void> getdetails(int idproductss) async {
//     isloadingproduct=true;
//     notifyListeners();
//     final url = Uri.parse(
//         'http://3.65.222.77/api/v1/products/$idproductss');
//     final response = await http.get(url,headers:{
//       'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhYmxlX2lkIjoxNDAsImF1dGhlbnRpY2FibGVfdHlwZSI6IkN1c3RvbWVyIiwiZGV2aWNlIjoxODA3LCJjcmVhdGVkX2F0IjoxNjk3NzIyNDczLCJleHAiOjQ4NTM0MTc2NzN9.7JuPdh79-ZYW-2SRGPnZCoirGcKVT9slqbkeRcdBwQg',
//       'Cookie':'__profilin=p%3Dt',
//       'Postman-Token':'<calculated when request is sent>',
//       'User-Agent':'PostmanRuntime/7.33.0',
//       'Accept':'*/*',
//       'Accept-Encoding':'gzip, deflate, br',
//       'Connection':'keep-alive',
//       'Timezone':'{{time_zone}}'


//     } );
//     if (response.statusCode == 200) {
//       print("inside if");
//       final Map<String, dynamic> listdata = json.decode(response.body);
//       print(listdata);
//      // final extraProductlist = listdata['data']['products'];
//       print('============${listdata['data']['product']}');
//       if (listdata['data']['product'] != null) {
// print("not null");
//        productlists=Product.fromJson(listdata['data']['product'])
//         ;
//        print('--------$productlists');
      

//       }
//       isloadingproduct=false;
//       notifyListeners();
//     }
    

//      //throw 'something went wrong';
   
//   }
// }