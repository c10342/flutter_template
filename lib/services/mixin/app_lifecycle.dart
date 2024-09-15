import 'package:flutter/material.dart';

mixin AppLifecycleMixin<T extends StatefulWidget> on State<T> {
  late final AppLifecycleListener listener;

  @override
  void initState() {
    super.initState();
    listener = AppLifecycleListener(
      onShow: onAppShow,
      onResume: onAppResume,
      onHide: onAppHide,
      onInactive: onAppInactive,
      onPause: onAppPause,
      onRestart: onAppRestart,
      onStateChange: onAppStateChange,
    );
  }

  // App状态变更
  void onAppStateChange(AppLifecycleState state) {}

  // 可见，并且可以响应用户操作时的回调
  void onAppResume() {}

  // 可见，但无法响应用户操作时的回调
  void onAppInactive() {}

  // 隐藏时的回调
  void onAppHide() {}

  // 显示时的回调。
  void onAppShow() {}

  // 暂停时的回调
  void onAppPause() {}

  // 暂停后恢复时的回调
  void onAppRestart() {}


  @override
  void dispose() {
    listener.dispose();
    super.dispose();
  }
}