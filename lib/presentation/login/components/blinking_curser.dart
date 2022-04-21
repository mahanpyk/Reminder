import 'package:flutter/material.dart';
import 'package:reminder/app/theme/app_colors.dart';

class BlinkingCursor extends StatefulWidget {
  const BlinkingCursor({Key? key}) : super(key: key);

  @override
  BlinkingCursorState createState() => BlinkingCursorState();
}

class BlinkingCursorState extends State<BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        height: 20,
        width: 2,
        color: AppColors.editTextBorderColor,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
