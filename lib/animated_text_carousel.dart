import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedTextCarousel extends StatefulWidget {
  const AnimatedTextCarousel({super.key});

  @override
  State<AnimatedTextCarousel> createState() => _AnimatedTextCarouselState();
}

class _AnimatedTextCarouselState extends State<AnimatedTextCarousel> {
  final PageController _pageController = PageController();

  List<List<String>> _texts = [
    ['Just Do It', '간단하다. 흔들리면 그것은 지방이다.'],
    ['꾸준히 하다 보면 변화가 온다.', '포기하지 말고 끝까지 해라.'],
    ['더 나은 내일을 위해', '오늘 최선을 다하자.'],
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _texts.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                _texts[index][0],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(_texts[index][1],
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        }
      ),
    );
  }
}
