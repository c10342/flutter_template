import 'package:flutter/material.dart';
import 'package:flutter_template/router/index.dart';

mixin RouteLifecycleMixin<T extends StatefulWidget> on State<T>, RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 发布订阅
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    // 移除
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}