import 'package:flutter/material.dart';
import 'package:flutter_template/services/enums/common.dart';

class SystemStore extends ChangeNotifier {
//  系统语言，私有属性，禁止外部直接修改
  String _lang = LangEnum.zhCN;

// 读
  String get lang => _lang;

// 写
  void setLang(String lang) {
    _lang = lang;
    // 修改数据后，通知更新
    notifyListeners();
  }
}
