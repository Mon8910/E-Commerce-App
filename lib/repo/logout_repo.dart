import 'dart:convert';

import 'package:demo_project/services/logout_services.dart';

class LogoutRepo{
  final logoutServices=LogoutServices();
  Future<bool> logout()async{
    final response=await logoutServices.logout();
    if(response.statusCode==200){
        final Map<String,dynamic> extractedData=jsonDecode(response.body);
        return true;
    }
    else{
      return false;
    }
  }

}