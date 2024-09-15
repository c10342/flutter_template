import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/router/index.dart';
import 'package:flutter_template/services/enums/common.dart';
import 'package:flutter_template/store/system.dart';
import 'package:flutter_template/store/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserStore>(create: (context) => UserStore()),
      ChangeNotifierProvider<SystemStore>(create: (context) => SystemStore())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SystemStore systemStore = Provider.of(context);
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
//      路由
      routerConfig: router,
//      国际化
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 支持的语言
      supportedLocales: S.delegate.supportedLocales,
      // 当前语言
      locale: Locale.fromSubtags(
          languageCode: systemStore.lang == LangEnum.enUS ? 'en' : 'zh',
          countryCode: systemStore.lang == LangEnum.zhCN
              ? 'CN'
              : systemStore.lang == LangEnum.zhTW
                  ? 'TW'
                  : null),
    );
  }
}
