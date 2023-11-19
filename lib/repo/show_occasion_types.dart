import 'dart:convert';

import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/services/show_occasion_types_serrvices.dart';

class ShowOccaisonsRepo {
  final showOccaionsSerices = OccaionsShowServices();
  Future<OccaionsModel?> showOccaison(int showOccaionsId) async {
    final response = await showOccaionsSerices.occaionsTypes(showOccaionsId);
    if (response.statusCode == 200) {
      final Map<String, dynamic> extractedData = json.decode(response.body);
      print('bodu is ready ok ${response.body}');
      final occaionsData = extractedData['data']['occasion_type'];
      final data=OccaionsModel.fromJson(occaionsData);

      return data;
    } else {
      return null;
    }
  }
}
