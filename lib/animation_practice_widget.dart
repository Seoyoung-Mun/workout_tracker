import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
  double _width = 115;
  double _height = 115;
  Color _color = Colors.blueAccent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: Duration(seconds: 2),
          child: FlutterLogo(size: 115),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = _width == 115? 215: 115;
            _height = _height == 115? 215: 115;
            _color = _color == Colors.blueAccent? Colors.red: Colors.blueAccent;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
