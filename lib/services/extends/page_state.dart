import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/services/mixin/app_lifecycle.dart';
import 'package:flutter_template_mobile/services/mixin/route_lifecycle.dart';

abstract class PageState<T extends StatefulWidget> extends State<T>
    with RouteAware, RouteLifecycleMixin, AppLifecycleMixin {
  //当前页面进入时触发
  @override
  void didPush() {
    onPageShow();
  }

  //当前页面退出时触发
  @override
  void didPop() {
    // 页面退出应该是销毁了，不是隐藏动作
    // onHide();
  }

  //下一个页面退出返回时触发
  @override
  void didPopNext() {
    onPageShow();
  }

  //当前页面跳转到下一个页面时触发
  @override
  void didPushNext() {
    onPageHide();
  }

// 页面显示
  onPageShow() {}

//  页面隐藏
  onPageHide() {}
}
