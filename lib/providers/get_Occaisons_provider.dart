import 'dart:convert';
import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetOccaisonsprovider extends ChangeNotifier{
  bool isloadingproduct=false;
  //List<Product> productlists=[];

   datamodel occc=datamodel();
   //Currency cy=Currency();

  Future<void> dataall(int? idmethod) async {
    isloadingproduct=true;
    notifyListeners();
    final url=Uri.parse('http://3.65.222.77/api/v1/lookups/occasion_types/$idmethod');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("inside issssf");
      final Map<String, dynamic> datam = json.decode(response.body);
      print(datam);
     // final extraProductlist = listdata['data']['products'];
      print('============${datam['data']['occasion_type']}');
      if (datam['data']['occasion_type'] != null) {
print("not null");
       occc=datamodel.fromJson(datam['data']['occasion_type'])
        ;
       print('--------$occc');
      

      }
      isloadingproduct=false;
      notifyListeners();
    }
    

     //throw 'something went wrong';
   
  }
}