import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LandingPage());
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

            //     child: Image(
            //         //image:NetworkImage('https://plus.unsplash.com/premium_photo-1666736568986-b08a81c23575?q=80&w=1992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), //온라인상의 이미지를 불러옴
            //         image: AssetImage('assets/runner.png'), //assets폴더에는 자주 사용하는 이미지를 넣으면 좋음
            //     ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body:
        SafeArea(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, //가로를 꽉 채우기
            children: [
              Container( //빈 컨테이너로 위젯의 가로 확장
                height: 0,
                width: double.infinity, // 무한대로 넓히기
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                width: 200,
                height: 100,
                color: Colors.green[100],
                child: Text('남들이 그만둘 때, 난 계속한다.',),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                width: 200,
                height: 100,
                color: Colors.green[100],
                child: Text('남들이 그만둘 때, 난 계속한다.',),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                width: 200,
                height: 100,
                color: Colors.green[100],
                child: Text('남들이 그만둘 때, 난 계속한다.',),
              ),
            ],
          ),
        ));
  }
}
