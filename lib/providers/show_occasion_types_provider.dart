import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:flutter/material.dart';

class ShowOccaisonsProvider extends ChangeNotifier{
   bool isloadingproduct = false;
   OccaionsModel getOccaison=OccaionsModel();
   final showOccaionsTypes=ShowOccaisonsRepo();
   void updateOccaisonShow(OccaionsModel value){
    getOccaison=value;
    notifyListeners();
   }

  
  
}





