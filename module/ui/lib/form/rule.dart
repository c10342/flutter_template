
import 'dart:async';

import 'package:module_utils/is.dart';

class ValueTypeEnum {
  static const String string = 'String';

  ValueTypeEnum._internal() {
    // 私有构造函数，确保无法直接实例化
  }
}

class Rule {
//  是否必填
  bool? required;

//  校验的值类型
  String? type;

//  错误信息
  String message;

//  自定义校验函数
  Future<bool> Function(dynamic value)? validator;

//  触发方式
  String? trigger;

  Rule(
      {this.required = false,
      this.type = ValueTypeEnum.string,
      required this.message,
      this.validator,
      this.trigger = 'change'});

  Future<Rule> validate(dynamic value) async {
    if (type == ValueTypeEnum.string) {
      return await _validateString(value);
    }

    return this;
  }

  Future<Rule> _validateString(String? value) async {
    if (required == true) {
      // 必填
      if (!isDef(value)) {
        return Future.error(this);
      }
    } else if (isFunction(validator)) {
      // 自定义
      bool res = await validator!(value);
      if (!res) {
        return Future.error(this);
      }
    }
    return this;
  }
}
