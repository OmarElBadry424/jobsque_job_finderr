import 'package:flutter/cupertino.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  PageTransition({required this.page, required this.direction})
      : super(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );

  @override
  Widget buildTransitions(context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: Tween<Offset>(begin:
      Offset(1.0, 0.0),
          end: Offset.zero).chain(CurveTween(curve: Curves.easeOut))
          .animate(animation),
      child: child,
    );
  }
}
