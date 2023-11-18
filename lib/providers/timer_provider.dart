import 'dart:async';
import 'package:flutter/material.dart';
class CountdownProvider with ChangeNotifier {
  int _remainingSeconds = 60;
  late Timer _countdownTimer;

  int get remainingSeconds => _remainingSeconds;

  CountdownProvider() {
    startTimer();
  }

  void startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _countdownTimer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }
}