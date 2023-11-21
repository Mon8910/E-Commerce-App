import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:flutter/material.dart';

class ShowOccasionsProvider extends ChangeNotifier {
  OccasionsModels getOccaSion = OccasionsModels();
  final showOccaionsRepo = ShowOccaisonsRepo();
  void updateOccasionShow(OccasionsModels value) {
    getOccaSion = value;
    notifyListeners();
  }
}
