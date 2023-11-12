import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading ;
  void setaIsdloading(bool val){
    _isloading=val;
    notifyListeners();
  }
  
}







