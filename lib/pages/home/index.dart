import 'package:flutter/material.dart';
import 'package:flutter_template/services/extends/page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('首页'),
    );
  }
}
