import 'package:flutter/material.dart';
import 'package:module_ui/form/provider.dart';

class Form extends StatefulWidget {
  // formItem标签宽度
  double? labelWidth;

//  子节点
  List<Widget> children;

//  数据模型
  Map<String, dynamic>? model;

  Form({super.key, this.labelWidth, this.children = const [], this.model});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return FormProvider(
        labelWidth: widget.labelWidth,
        model: widget.model,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.children,
        ));
  }
}
