import 'dart:convert';

// import 'package:demo_project/models/login_model%20.dart';
import 'package:demo_project/models/user_model.dart';
import 'package:demo_project/services/login_services.dart';

class LoginRepo{
  final loginServices=LoginServices();
  Future<bool> login(
      {required String phone,
      required String password,
      required String code})async{
        final response=await loginServices.login(phone: phone, password: password, code: code)
        ;
        if(response.statusCode==200){
          final Map<String,dynamic> extractedData=jsonDecode(response.body);
           UserModel userModel=UserModel.fromJson(extractedData['data']['user']);
           
          return true;
          
        }
        else{
          return false;
        }
      }
}
