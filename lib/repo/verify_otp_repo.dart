
import 'package:demo_project/services/verify%20otp_services.dart';

class VerifyOtpRepo{
  final verifyOtpsServices=VerifyOtpServices();
  Future<bool> verifyOtpRepo ({required String otp})async{
    
   final response=await verifyOtpsServices.verifyOtpServices(otp: otp);
   if(response.statusCode==200){
    return true;

   }
   else{return false;}
    
  }

}




