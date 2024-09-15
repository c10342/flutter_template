import 'package:flutter/material.dart';
import 'package:module_ui/form/provider.dart';
import 'package:module_ui/form/rule.dart';
import 'package:module_utils/is.dart';

class BaseFormItem extends StatefulWidget {
//  标签
  String? label;

//  宽度
  double? labelWidth;

//  子节点
  Widget? child;

//校验规则
  List<Rule>? rules;

//  读取值的路径
  String? prop;

  BaseFormItem(
      {super.key,
      this.labelWidth,
      this.label,
      this.child,
      this.prop,
      this.rules});

  @override
  State<BaseFormItem> createState() => _BaseFormItemState();
}

class _BaseFormItemState extends State<BaseFormItem> {
  String errMsg = '';

//  校验数据
  Future<Rule?> validate({String? type = 'change'}) async {
    FormProvider? formProvider = FormProvider.of(context);
    setState(() {
      // 先清空错误信息
      errMsg = '';
    });
    Future<Rule?> p = Future.value(null);
    if (isDef(formProvider?.model) &&
        isDef(widget.prop) &&
        widget.rules?.isNotEmpty != null) {
      dynamic value = formProvider!.model![widget.prop!];
      for (var rule in widget.rules!) {
        // 串联起来
        p = p.then((data) => rule.validate(value));
      }
      p.catchError((error) {
        String message = '';
        if (error is Rule) {
          // 校验失败的信息
          message = error.message ?? '';
        } else {
          // 其他失败的信息
          message = error.toString();
        }
        setState(() {
          errMsg = message;
        });
        return error;
      });
    }
    return p;
  }

  @override
  Widget build(BuildContext context) {
    FormProvider? formProvider = FormProvider.of(context);
    return FormItemProvider(
        validate: validate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//            标签部分
            if (widget.label != null && widget.label != '')
              SizedBox(
                width: widget.labelWidth ?? formProvider?.labelWidth,
                child: Text(
                  widget.label!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            // 内容区域
            if (widget.child != null) widget.child!,
            // 错误信息部分
            Text(
              errMsg,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            )
          ],
        ));
  }
}
