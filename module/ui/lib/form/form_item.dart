import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:module_ui/form/provider.dart';

class FormItem extends StatefulWidget {
  String? label;
  double? labelWidth;
  Widget? child;

//  读取值的路径
  String? prop;

  FormItem({super.key, this.labelWidth, this.label, this.child, this.prop});

  @override
  State<FormItem> createState() => _FormItemState();
}

class _FormItemState extends State<FormItem> {
  String errMsg = '';

//  校验数据
  validate({String? type = 'change'}) {
    FormProvider? formProvider = FormProvider.of(context);
    if (formProvider?.model != null &&
        widget.prop != null &&
        widget.prop != '') {
      dynamic value = formProvider!.model![widget.prop!];
      if (value == null || value == '') {
        setState(() {
          errMsg = '';
        });
      } else {
        setState(() {
          errMsg = '错误信息';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FormProvider? formProvider = FormProvider.of(context);
    return FormItemProvider(
        validate: validate,
        child: Container(
          width: double.infinity,
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
          ),
        ));
  }
}
