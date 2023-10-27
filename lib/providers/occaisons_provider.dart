import 'dart:convert';
import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Occaisonsprovider extends ChangeNotifier{
  bool isloading=false;

  List<datamodel> oc=[];

  Future<List<datamodel>> occds() async {
    isloading=true;
    notifyListeners();
    final url=Uri.parse(Appurl.occaisonsType);
    final response = await http.get(url,);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listdata = json.decode(response.body);
      print(listdata);
      final extradata = listdata['data']['occasion_types'] as List<dynamic>?;
      final List<datamodel> productlist = [];
      if (extradata != null) {
        for (var i in extradata) {
          productlist.add(datamodel.fromJson(i));
        }

      }
      oc=productlist;
      isloading=false;
      notifyListeners();
    }
    

    // throw 'something went wrong';
    return [];
  }
}


