import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/services/enums/common.dart';

class SystemStore extends ChangeNotifier {
//  系统语言
  String _lang = LangEnum.zhCN;

  String get lang => _lang;

  void setLang(String lang) {
    _lang = lang;
    // 修改数据后，通知更新
    notifyListeners();
  }
}
