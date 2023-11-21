
import 'package:demo_project/services/reset_new_password_widget.dart';

class ResetNewPasswordRepo{
  final resetNewPasswordServices=ResetNewPasswordServices();
  Future<bool> resetNewPasswords({required String password, required String confermtionPassword})async{
    final response=await resetNewPasswordServices.resetNewPassword(password: password, confermtionPassword: confermtionPassword);
   if(response.statusCode==200){
    
    return true;
   }
   else{
    return false;
   }

  }
}