import 'package:flutter/material.dart';

class UserStore extends ChangeNotifier {
//  token，私有属性，禁止外部直接修改
  String _token = '';

// 读
  String get token => _token;

// 写
  void setToken(String token) {
    _token = token;
    // 修改数据后，通知更新
    notifyListeners();
  }
}
