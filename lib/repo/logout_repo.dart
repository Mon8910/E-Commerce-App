
import 'package:demo_project/services/logout_services.dart';

class LogoutRepo{
  final logoutServices=LogoutServices();
  Future<bool> logout()async{
    final response=await logoutServices.logout();
    if(response.statusCode==200){
       
        return true;
    }
    else{
      return false;
    }
  }

}