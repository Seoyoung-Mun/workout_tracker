import 'package:flutter/material.dart';
// import '../constants.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            FractionallySizedBox(
              widthFactor: 0.5,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              // decoration: conTextFieldDecoration.copyWith(hintText: '이메일을 입력하세요'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              // decoration: conTextFieldDecoration.copyWith(hintText: '비밀번호를 입력하세요'),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: ()  {

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                // child: Text('로그인',style: conButtonTextStyle,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
