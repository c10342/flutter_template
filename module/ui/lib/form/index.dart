import 'package:flutter/material.dart';
import 'package:module_ui/form/controller.dart';
import 'package:module_ui/form/provider.dart';
import 'package:module_ui/form/rule.dart';

class BaseForm extends StatefulWidget {
  // formItem标签宽度
  double? labelWidth;

//  子节点
  List<Widget> children;

//  数据模型
  Map<String, dynamic>? model;

  FormController? controller;

  BaseForm(
      {super.key,
      this.labelWidth,
      this.children = const [],
      this.model,
      this.controller});

  @override
  State<BaseForm> createState() => _BaseFormState();
}

class _BaseFormState extends State<BaseForm> {
  List<Future<Rule?> Function()> validateCbs = [];

  Future<dynamic> validate() async {
    // todo
  }

  addValidate(){}

  removeValidate(){}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller?.validate = validate;
  }

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
