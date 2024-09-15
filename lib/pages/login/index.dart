import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/generated/l10n.dart';
import 'package:flutter_template_mobile/services/extends/page_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    S t = S.of(context);
    return Text(t.login);
  }
}
