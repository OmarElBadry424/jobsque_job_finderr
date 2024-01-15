import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  const Transition({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  State<Transition> createState() =>
      _TransitionState();
}

class _TransitionState extends State<Transition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
