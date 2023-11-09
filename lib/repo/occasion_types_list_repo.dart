import 'dart:convert';
import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/providers/occaisons_provider.dart';
import 'package:demo_project/services/occasion_types_service.dart';

class OccasionsRepo {
  final occaionsServices = OccaionsServices();
  Future <List<OccaionsModel>?> occaions() async {
    final response = await occaionsServices.occaionsTypes();
    if (response.statusCode == 200) {
      
      final Map<String, dynamic> extractedData = json.decode(response.body);
      print('body is ready ok ${response.body}');
       final occaionsData = extractedData['data']['occasion_types'];

     final List<OccaionsModel>occaisonTypeList=OccaionsModel.occaisonTypelist(occaionsData);
     Occaisonsprovider();
     return occaisonTypeList;
     
     
    
    }
    else{
      return null;
    }

  }
  
}
