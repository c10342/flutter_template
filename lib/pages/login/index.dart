import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/services/extends/page_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('登录');
  }
}
