import 'package:flutter/material.dart';

class UserStore extends ChangeNotifier {
//  token
  String _token = '';

  String get token => _token;

  void setToken(String token) {
    _token = token;
    // 修改数据后，通知更新
    notifyListeners();
  }
}
