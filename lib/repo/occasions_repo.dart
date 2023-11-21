import 'dart:convert';
import 'package:demo_project/models/occasions_models.dart';
import 'package:demo_project/services/occasion_services.dart';

class OccasionsRepo{
  final occasionsServices = OccasionsServices();
  Future<List<OccasionsModels>?> occaionsRepo() async {
    final response = await occasionsServices.occasions();
    if (response.statusCode == 200) {
      final Map<String, dynamic> extractedData = json.decode(response.body);
      //print('body is ready ok ${response.body}');
      final occaionsData = extractedData['data']['occasion_types'];

      final List<OccasionsModels> occasionList =
          OccasionsModels.occasionTypelist(occaionsData);
         
      return occasionList;
    } else {
      return null;
    }
  }
}
