import 'dart:convert';
import 'dart:io';

import 'package:demo_project/constants/variables.dart';
import 'package:demo_project/screens/auth_code.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthForgetpassword extends ChangeNotifier{
  bool _isloading=false;
  String _resmessage='';
  

  bool get isloadingforget => _isloading;
  String get resmessage=>_resmessage;

  void forgetpassword({
    required String phone,
    required String code,
   required BuildContext context

  })async{
    _isloading=true;
    notifyListeners();
    
    final body=
    {
    "user": {
        "country_code": code,
        "phone_number": phone
    }
}
;
  //print(body);
  try{
    final url =Uri.parse(Appurl.authcodeurl);
    http.Response res= await http.post(url,body: json.encode(body),
    headers: {
     'Content-Type': 'application/json',
      'Timezone':'time_zone',
      'Accept-Language':'language'
    });
    if(res.statusCode==200||res.statusCode==201){
      final req=json.decode(res.body);
     
      

      
      print(req);
      _isloading=false;
      _resmessage='true';
      notifyListeners();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AuthCode()),
        );

    }else{
      final req=json.decode(res.body);
      print(req);
      _isloading=false;
      _resmessage='error';
      notifyListeners();
    }

  }on SocketException catch(_){
    _isloading=false;
    _resmessage='internet connection is not avaliable' ;
    notifyListeners();
  }catch(e){
    _isloading=false;
    _resmessage='please try again';
    notifyListeners();
  }




}
void clear() {
    _resmessage = "";
    // _isLoading = false;
    notifyListeners();
  }


}
