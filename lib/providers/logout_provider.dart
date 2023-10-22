import 'package:demo_project/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthLogout extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> logout() async {
    
    final url=Uri.parse(Appurl.logOut);
    final response = await http.post(url);

    if (response.statusCode == 200) {
      _isLoggedIn = true;
     
      notifyListeners();
    } else {
      throw Exception('Logout failed');
    }
  }
}
