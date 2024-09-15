import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/router/index.dart';
import 'package:flutter_template_mobile/store/system.dart';
import 'package:flutter_template_mobile/store/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserStore>(create: (context)=>UserStore()),
    ChangeNotifierProvider<SystemStore>(create: (context)=>SystemStore())
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
