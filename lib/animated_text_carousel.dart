import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedTextCarousel extends StatefulWidget {
  const AnimatedTextCarousel({super.key});

  @override
  State<AnimatedTextCarousel> createState() => _AnimatedTextCarouselState();
}

class _AnimatedTextCarouselState extends State<AnimatedTextCarousel> {
  final PageController _pageController = PageController();
  late Timer _timer;

  List<List<String>> _texts = [
    ['Just Do It', '간단하다. 흔들리면 그것은 지방이다.'],
    ['꾸준히 하다 보면 변화가 온다.', '포기하지 말고 끝까지 해라.'],
    ['더 나은 내일을 위해', '오늘 최선을 다하자.'],
  ];
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      _currentPage++;
      //pagecontroller로 다음 페이지 이동시키기
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    },);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int loopedIndex){
            setState(() {
              _currentPage = loopedIndex;
            });
          },
          // itemCount: _texts.length, //페이지 개수
          itemBuilder: (context, index) {
            int loopedIndex = index % _texts.length;
            /* %는 나머지를 구하는 연산자
            index가 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19.. 이렇게 나오는데
            %연산자를 쓰면 0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1 이렇게 나옴*/
            return Column(
              children: [
                Text(
                  _texts[loopedIndex][0],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  _texts[loopedIndex][1],
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          }),
    );
  }
}
