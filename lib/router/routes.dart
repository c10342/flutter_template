import 'package:flutter/material.dart';
import 'package:flutter_template/router/index.dart';
import 'package:go_router/go_router.dart';

class Routes {
//  通过命令路由进入页面
  static void pushName(String name,
      {BuildContext? context,
      Map<String, dynamic> query = const <String, dynamic>{},
      bool? replace}) {
    BuildContext? ctx = context ?? navigatorKey.currentContext;
    if (ctx == null) {
      return;
    }
    if (replace == true) {
      // 替换页面
      ctx.replaceNamed(name, queryParameters: query);
    } else {
      ctx.goNamed(name, queryParameters: query);
    }
  }

//  离开页面
  static void pop({BuildContext? context}) {
    BuildContext? ctx = context ?? navigatorKey.currentContext;
    if (ctx == null) {
      return;
    }
    ctx.pop();
  }
}
