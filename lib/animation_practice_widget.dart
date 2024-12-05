import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
  TextStyle _textStyle = TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'NanumBrushScript');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDefaultTextStyle(
          style: _textStyle,
          duration: Duration(seconds: 1),
          child: Text('Hello, World!!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _textStyle =
                _textStyle == TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'NanumBrushScript')
                    ? _textStyle = TextStyle(fontSize: 48, color: Colors.blue, fontFamily: 'Jua')
                    : TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'NanumBrushScript');
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
