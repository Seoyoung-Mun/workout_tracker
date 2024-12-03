import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _contorller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _contorller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    final Animation<double> _curvedAnimation = CurvedAnimation(
      parent: _contorller,
      curve: Curves.easeInOut,
    );
    _animation = Tween<double>(begin: 50.0, end: 200.0).animate(_curvedAnimation);
    _animation.addListener(() {
      setState(() {});
    });

    _contorller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: _animation.value,
        height: _animation.value,
        color: Colors.red,
      ),
    ));
  }
}
