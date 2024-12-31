import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
  double _begin = 0;
  double _end = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: _begin, end: _end),
          builder: (context, value, child) {
            return Opacity(
              child: child,
              opacity: value,
            );
          },
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _begin = _begin == 0? 1:0;
            _end = _end == 0? 1:0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
