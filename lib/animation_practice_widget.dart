import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
Alignment _alignment = Alignment.topLeft;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedAlign(
  alignment: _alignment,
          duration: Duration(seconds: 2),
          child: FlutterLogo(size: 115),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _alignment = _alignment == Alignment.topLeft? Alignment.bottomRight: Alignment.topLeft;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
