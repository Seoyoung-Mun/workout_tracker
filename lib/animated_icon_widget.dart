import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  final IconData icon;
  final double? size;
  final Color color;
  AnimatedIconWidget(
      {super.key, required this.icon, required this.size, required this.color});

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    final Animation<double> _curvedAnimation =
    CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 40), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -20.0, end: 7.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 7.0, end: -3.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.5, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(_curvedAnimation);

    _animation.addListener(() { // addListener는 애니메이션의 값이 변경될 때마다 호출되는 메서드
      if (_animation.status ==
          AnimationStatus.completed) { // 애니메이션이 완료되면 무한반복 하기 위해 다시 시작
        _controller
            .reverse(); // reverse는 애니메이션을 뒤에서부터 시작하는 메서드. 이 메서드를 호출하면 애니메이션이 뒤에서부터 시작
      } else if (_animation.status ==
          AnimationStatus.dismissed) { // 애니메이션이 처음부터 다시 시작되면
        _controller
            .forward(); // forward는 애니메이션을 시작하는 메서드. 이 메서드를 호출하면 애니메이션이 시작
      }

      // setState(() {});// setState를 호출하면서 애니메이션의 값을 변경하면서 화면을 다시 그리도록 함

    });

    // _controller.forward(); // forward는 애니메이션을 시작하는 메서드. 이 메서드를 호출하면 애니메이션이 시작
  }

  @override
  void dispose() { // dispose는 위젯이 사라질 때 호출되는 메서드. 애니메이션을 사용할 때는 반드시 dispose를 호출해야 함.
    // _controller.dispose(); // dispose는 위젯이 사라질 때 호출되는 메서드. 애니메이션을 사용할 때는 반드시 dispose를 호출해야 함.
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 0.0174533, // 0.0174533은 1도를 라디안 값으로 변환한 것
          child: Icon(
            widget.icon,
            size: widget.size,
            color: widget.color,
          ),
        );
      },

    );
  }
}
