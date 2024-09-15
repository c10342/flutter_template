import 'package:flutter/material.dart';
import 'package:module_ui/form/provider.dart';
import 'package:module_utils/is.dart';

class Input extends StatefulWidget {
//  是否禁用
  bool disabled;

//  最大长度
  int maxLength;

//  输入框的值发生变化
  Function(String value)? onChange;

//  输入框初始值
  String value;

//  输入框类型，text，password
  String type;

//  文本占位符
  String placeholder;

  Input(
      {Key? key,
      this.disabled = false,
      this.maxLength = -1,
      this.onChange,
      this.value = '',
      this.type = 'text',
      this.placeholder = ''})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  onChange(String value) {
    FormItemProvider? provider = FormItemProvider.of(context);
    if (isFunction(widget.onChange)) {
      // 通知外面
      widget.onChange!(value);
    }
    if (isFunction(provider?.validate)) {
      // 触发表单校验
      provider!.validate!(type: 'change');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLength: widget.maxLength,
      onChanged: widget.onChange,
      enabled: widget.disabled,
//      密码输入
      obscureText: widget.type == 'password',
      decoration: InputDecoration(hintText: widget.placeholder),
    );
  }
}
