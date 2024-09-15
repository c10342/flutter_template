import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/services/extends/page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text('首页');
  }
}
