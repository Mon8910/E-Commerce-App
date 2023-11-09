import 'dart:convert';

import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/services/show_occasion_types_serrvices.dart';

class ShowOccaisonsRepo {
  final showOccaionsRepo = OccaionsShowServices();
  Future<OccaionsModel?> getoccaionsRepo(int idmethod) async {
    final response = await showOccaionsRepo.occaionsTypes(idmethod);
    if (response.statusCode == 200) {
      final Map<String, dynamic> datam = json.decode(response.body);
      print('bodu is ready ok ${response.body}');
      final occaionsData = datam['data']['occasion_type'];
      final data=OccaionsModel.fromJson(occaionsData);

      return data;
    } else {
      return null;
    }
  }
}
