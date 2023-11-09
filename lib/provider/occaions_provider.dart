import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/repo/product_list_repo.dart';
import 'package:flutter/material.dart';

class ProductOccaisonss extends ChangeNotifier{
  bool isloading=false;
  List<Product> productList=[];
  final productListRepo=ProductListRepo();
  Future<void> productListsProvider(int idmethod)async{
    isloading=true;
    notifyListeners();
    final listProduct=await productListRepo.productList(idmethod);
    productList=listProduct!;
    isloading=false;
    notifyListeners();
  }


}





// import 'package:demo_project/models/occaisons_list_model.dart';
// import 'package:demo_project/repo/occasion_types_list_repo.dart';
// import 'package:flutter/material.dart';
// class Occaisonsprovider extends ChangeNotifier{
//    bool isloading=false;
//    List<OccaionsModel>occaionsList=[];
//   final occaionsRepo=OccasionsRepo();
//   Future<void> occaisonsprovider()async{
//     isloading=true;
//     notifyListeners();
//     final listoccaions=await occaionsRepo.occaions();
//     occaionsList=listoccaions!;
   
    
        
        
         
     
//         isloading=false;
//         notifyListeners();
        

      
//     }
// }



