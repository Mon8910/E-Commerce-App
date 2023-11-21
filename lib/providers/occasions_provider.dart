import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/repo/occasions_repo.dart';
import 'package:flutter/material.dart';

class OccasionsProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  List<OccasionsModels> occaionsList = [];
  final occaionsRepo = OccasionsRepo();
  void updateOccasionList(List<OccasionsModels> value) {
    occaionsList = value;
    notifyListeners();
  }
}
