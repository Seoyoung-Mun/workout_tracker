import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  //컨트롤러를 만들려면 Ticker 필요
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/runner.png'),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // 세로를 가득 채우기
                      // crossAxisAlignment: CrossAxisAlignment.stretch, //가로를 가득 채우기
                      children: [
                        // Container(
                        //   //빈 컨테이너로 위젯의 가로 확장
                        //   height: 0,
                        //   width: double.infinity, // 무한대로 넓히기
                        // ),
                        FadeTransition(
                          opacity: _animation,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: 50,
                            color: Colors.green[100],
                            child: Text(
                              '남들이 그만둘 때, 난 계속한다.',
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "NanumBrushScript"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                          width: double.infinity, // 무한대로 넓히기
                        ),

                        Column(
                          children: [
                            Container(
                              child: Text(
                                '환영합니다.',
                                style:
                                    TextStyle(fontSize: 30, fontFamily: "Jua"),
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
                              onPressed: () {
                                context.go('/workout_home');
                              } /*콜백함수를 통해서 클릭함수 발생*/,
                              child: Text(
                                'START',
                                style:
                                    TextStyle(fontSize: 25, fontFamily: "Jua"),
                              ),
                            ),
                          ],
                        )
                      ]),
                ))));
  }
}
