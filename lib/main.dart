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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch, //가로를 꽉 채우기
                children: [
              Container(
                //빈 컨테이너로 위젯의 가로 확장
                height: 0,
                width: double.infinity, // 무한대로 넓히기
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(8),
                width: double.infinity,
                height: 50,
                color: Colors.green[100],
                child: Text(
                  '남들이 그만둘 때, 난 계속한다.',
                  style:
                      TextStyle(fontSize: 25, fontFamily: "NanumBrushScript"),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 50),
                padding: EdgeInsets.all(8),
                child: Image(
                  image: AssetImage('assets/runner.png'),
                ),
              ),
              Container(
                child: Text(
                  '환영합니다.',
                  style: TextStyle(fontSize: 35),
                  // textAlign: TextAlign.center,
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   width: 100,
              //   height: 30,
              //   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              //   child: Text(
              //     'START',
              //     style: TextStyle(fontSize: 25, color: Colors.purple),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {} /*콜백함수를 통해서 클릭함수 발생*/,
                child: Text(
                  'START',
                  style: TextStyle(fontSize: 25, fontFamily: "Jua"),
                ),
              )
            ])));
  }
}
