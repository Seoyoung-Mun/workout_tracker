import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text Widget
                  Text(
                    '비밀번호 재설정을 위해\n이메일을 입력해주세요',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '이메일',
                      hintText: 'example@example.com',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always, //label이 항상 위로 올라오게 함
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력해 주세요.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return '유효한 이메일을 입력하세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 24),
                  //Button Widget
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save(); //save를 해줘야 입력한 값이 저장됨
                          // _formKey.currentState?.reset(); //reset을 해줘야 입력한 값이 지워짐
                        }
                      },
                      child: Text('비밀번호 재설정 이메일 보내기'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '* 이메일을 통해 비밀번호 재설정 링크를 확인하세요.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
