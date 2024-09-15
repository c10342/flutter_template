import 'package:flutter/material.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/services/extends/page_state.dart';
import 'package:module_ui/form/controller.dart';
import 'package:module_ui/form/form_item.dart';
import 'package:module_ui/form/index.dart';
import 'package:module_ui/form/rule.dart';
import 'package:module_ui/input/index.dart';
import 'package:module_utils/is.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageState<LoginPage> {
  FormController controller = FormController();
  Map<String, String> formModel = {'userName': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    S t = S.of(context);
    return Scaffold(
      body: Column(
        children: [
          Text(t.login),
          Padding(
            padding: const EdgeInsets.all(10),
            child: BaseForm(
              model: formModel,
              controller: controller,
              children: [
                BaseFormItem(
                  label: '账号',
                  prop: 'userName',
                  rules: [Rule(message: '请填写', required: true)],
                  child: BaseInput(
                    maxLength: 10,
                    placeholder: '账号',
                    value: formModel['userName'] ?? '',
                    onChange: (String value) {
                      setState(() {
                        formModel['userName'] = value;
                      });
                    },
                  ),
                ),
                BaseFormItem(
                  label: '密码',
                  prop: 'password',
                  rules: [Rule(message: '请填写', required: true)],
                  child: BaseInput(
                    placeholder: '密码',
                    value: formModel['password'] ?? '',
                    type: 'password',
                    onChange: (String value) {
                      setState(() {
                        formModel['password'] = value;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (controller.validate != null) {
                        controller.validate!().then((value) {
                          // todo
                        }).catchError((error) {
                          print(error);
                        });
                      }
                    },
                    child: const Text('登录'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
