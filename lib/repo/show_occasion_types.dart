import 'dart:convert';

import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/services/show_occasion_types_serrvices.dart';

class ShowOccaisonsRepo {
  final showOccaionsSerices = OccaionsShowServices();
  Future<OccasionsModels?> showOccaison(int showOccaionsId) async {
    final response = await showOccaionsSerices.occaionsTypes(showOccaionsId);
    if (response.statusCode == 200) {
      final Map<String, dynamic> extractedData = json.decode(response.body);
      print('bodu is ready ok ${response.body}');
      final occaionsData = extractedData['data']['occasion_type'];
      final data=OccasionsModels.fromJson(occaionsData);

      return data;
    } else {
      return null;
    }
  }
}
