import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:flutter/material.dart';

class GetOccaisonsprovider extends ChangeNotifier{
   bool isloadingproduct = false;
   OccaionsModel ocdd=OccaionsModel();
   final occaionstypes=ShowOccaisonsRepo();
  
  Future<void> ocdprovider(int idmethod)async{
    isloadingproduct=true;
    notifyListeners();
   final ocm=await occaionstypes.getoccaionsRepo(idmethod);
   ocdd=ocm!;
    
    isloadingproduct=false;
    notifyListeners();
    

  }
}





