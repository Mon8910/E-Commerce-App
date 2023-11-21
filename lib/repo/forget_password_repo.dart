import 'package:demo_project/services/forget_password_services.dart';

class ForgetPasswordRepo {
  final sendRestPasswordServices = ForgetPasswordServices();
  Future<bool> forgetPasswordRepo(
      {required String phone, required String code}) async {
    final response =
        await sendRestPasswordServices.forgetPassword(phone: phone, code: code);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
