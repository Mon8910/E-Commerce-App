
import 'package:demo_project/services/send_reset_password_info_services.dart';

class SendResetPasswordRepo {
  final sendRestPasswordServices = SendResetPasswordServices();
  Future<bool> sendRestPassword(
      {required String phone, required String code}) async {
    final response = await sendRestPasswordServices.sendRestPassword(
        phone: phone, code: code);
    if (response.statusCode == 200) {
      
      return true;
    } else {
      return false;
    }
  }
}
