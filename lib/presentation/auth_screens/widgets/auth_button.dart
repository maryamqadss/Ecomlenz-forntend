import 'package:flutter/material.dart';
import '../../../style/style.dart';

class AuthButton extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  AuthButton({
    super.key,
    required this.title,
    this.backgroundColor = primary_Color,
    this.textColor = Colors.white,
    required this.onPressed,
  });

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    _controller.forward().then((_) {
      _controller.reverse();
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(

      scale: _animation,
      child: ElevatedButton(

        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(

          backgroundColor: widget.backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
