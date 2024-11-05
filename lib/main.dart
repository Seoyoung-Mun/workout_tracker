import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage()
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Image(
              //image:NetworkImage('https://plus.unsplash.com/premium_photo-1666736568986-b08a81c23575?q=80&w=1992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), //온라인상의 이미지를 불러옴
              image: AssetImage('assets/runner.png'), //assets폴더에는 자주 사용하는 이미지를 넣으면 좋음
          ),
      ),
    );
  }
}
