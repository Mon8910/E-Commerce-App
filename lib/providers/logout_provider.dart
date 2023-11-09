import 'package:demo_project/constants/api_endpoints.dart';
import 'package:demo_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthLogout extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> logout(
    BuildContext context
  ) async {
    
    final url=Uri.parse(Appurl.logOut);
    final response = await http.delete(url, );

    if (response.statusCode == 200) {
      _isLoggedIn = true;
// ignore: use_build_context_synchronously
Navigator.of(context).pop(MaterialPageRoute(builder: (contexr){
  return const Login();
}));
     
      notifyListeners();
    } else {
      throw Exception('Logout failed');
    }
  }
}
