import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/services/firebase_auth_service.dart';
import 'package:workout_tracker/show_snackbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _auth = FirebaseAuthService();

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24), //
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 4,
                child: FractionallySizedBox(
                  // FractionallySizedBox는 화면의 너비를 기준으로 크기를 조정합니다.
                  widthFactor: 0.5, // 50%의 너비를 차지합니다.
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 48.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@example.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요.';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return '이메일 형식으로 입력해주세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true, // 비밀번호를 입력할 때 별표(*)로 가리기
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해주세요.';
                  }
                  if (value.length < 6) {
                    return '비밀번호는 6자리 이상이어야 합니다.';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.go('/settings/login/reset_password');
                    },
                    child: Text('Forgot your password?'),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      _auth
                          .signInWithEmail(email: email!, password: password!)
                          .then((_) {
                        //개발자가 인식하지 않아도 된다는 의미로 파라미터에 _를 사용
                        //then은 성공하면 실행
                        showSnackBar(context, '로그인이 되었습니다.');
                        context.go('/workout_home'); //로그인 성공하면 홈화면으로 이동
                      }).catchError((e) {
                        //catchError는 실패하면 실행
                        showSnackBar(context, e.toString());
                      });
                    }

                    //email, password => firebase 인증
                  },
                  child: Text('로그인'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go('/settings/login/registration');
                    },
                    style: ButtonStyle(
                        padding: WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.zero)),
                    child: Text('Sign up'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 화면에서 Keyboard가 보이는 단축키 Command+K
