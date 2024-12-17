import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/exception_handler.dart';
import 'package:workout_tracker/show_snackbar.dart';
import 'firebase_auth_service.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuthService();

  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
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
                    '회원 가입을 위해 \n정보를 입력 해 주세요.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //4개의 TextFormField
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '이름',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always, //label이 항상 위로 올라오게 함
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이름을 입력해 주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '이메일',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      hintText: 'exameple@example.com',
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    keyboardType: TextInputType.emailAddress, //@가 포함된 키보드로 바뀜
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이름을 입력해 주세요.';
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      hintText: '비밀번호를 입력하세요.',
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해 주세요.';
                      }
                      if (value.length < 6) {
                        return '비밀번호는 6자 이상이어야 합니다';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '비밀번호 확인',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      hintText: '비밀번호를 다시 입력하세요.',
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 다시 입력 해 주세요.';
                      } else if (value != _passwordController.text) {
                        print(
                            'value: $value, _passwordController.text: ${_passwordController.text}');
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //Button Widget
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save(); //save를 해줘야 입력한 값이 저장됨
                          // _formKey.currentState?.reset(); //reset을 해줘야 입력한 값이 지워짐
                        }
                        print('$name, $email, $password');
                        try {
                          _auth.signUpWithEmail(
                              email: email!, password: password!, name: name);
                          context.go('/workout_home');
                        } on WTException catch (error) {
                          showSnackBar(context, error.message ?? '');
                        } catch (e) {
                          showSnackBar(context, e.toString() ?? '');
                        }
                      },
                      child: Text('가입하기'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
