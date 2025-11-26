import 'package:flutter/material.dart';
import 'dart:async';

class StartupAnimation extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const StartupAnimation({super.key, required this.onAnimationComplete});

  @override
  State<StartupAnimation> createState() => _StartupAnimationState();
}

class _StartupAnimationState extends State<StartupAnimation>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();

    // Aguarda a animação terminar
    Future.delayed(const Duration(milliseconds: 950), () {
      widget.onAnimationComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        color: Colors.black.withOpacity(0.85),
        child: Center(
          child: Icon(
            Icons.shopping_bag_rounded,
            size: 110,
            color: Colors.white.withOpacity(0.95),
          ),
        ),
      ),
    );
  }
}
