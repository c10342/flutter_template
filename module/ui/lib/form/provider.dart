import 'package:flutter/material.dart';

//跨组件层级通信
class FormProvider extends InheritedWidget {
  double? labelWidth;

//  数据模型
  Map<String, dynamic>? model;

  FormProvider({super.key, required super.child, this.labelWidth, this.model});

  // 该方法用于检查是否需要重新构建依赖InheritedWidget的子树
  @override
  bool updateShouldNotify(covariant FormProvider oldWidget) {
    return labelWidth != oldWidget.labelWidth;
  }

  // 静态方法，允许子树中的任何位置获取UpdateProvider
  static FormProvider? of(BuildContext? context) {
    if (context?.dependOnInheritedWidgetOfExactType != null) {
      return context!.dependOnInheritedWidgetOfExactType<FormProvider>();
    }
    return null;
  }
}

class FormItemProvider extends InheritedWidget {
  Function({String? type})? validate;

  FormItemProvider({super.key, required super.child, this.validate});

  // 该方法用于检查是否需要重新构建依赖InheritedWidget的子树
  @override
  bool updateShouldNotify(covariant FormItemProvider oldWidget) {
    return validate != oldWidget.validate;
  }

  // 静态方法，允许子树中的任何位置获取UpdateProvider
  static FormItemProvider? of(BuildContext? context) {
    if (context?.dependOnInheritedWidgetOfExactType != null) {
      return context!.dependOnInheritedWidgetOfExactType<FormItemProvider>();
    }
    return null;
  }
}
