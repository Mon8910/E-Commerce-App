import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/repo/occasion_types_list_repo.dart';
import 'package:flutter/material.dart';

class OccaisonsProvider extends ChangeNotifier {
  bool _isloading=false;
  bool get isloading=>_isloading;
  void setIsloading(bool val){
    _isloading=val;
    notifyListeners();
  }
  List<OccaionsModel> occaionsList = [];
  final occaionsRepo = OccasionsRepo();
  void updateOccaisonList(List<OccaionsModel> value){
    occaionsList=value;
    notifyListeners();
  }
  
}
