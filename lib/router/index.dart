import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/pages/home/index.dart';
import 'package:flutter_template_mobile/pages/login/index.dart';
import 'package:go_router/go_router.dart';

//定义页面路径路径
class RouterNameEnum{
  static const  String login = 'login';
  static const  String home = 'home';
}


//获取全局 context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//监听路由变化
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

//页面路由
final GoRouter router = GoRouter(
  initialLocation: '/',
    // 获取全局 context
  navigatorKey: navigatorKey,
    // 监听路由变化
  observers: [routeObserver],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouterNameEnum.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          name: RouterNameEnum.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    ),
  ],
);