// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_colors.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Gradient gradientColors;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget child;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    this.gradientColors = MyColors.blueGradient,
    this.borderRadius = 60.0,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 4)),
        ],
        gradient: isEnabled
            ? gradientColors
            : LinearGradient(
                colors: [Colors.grey.shade500, Colors.grey.shade500],
              ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadowColor: Colors.transparent,
        ),
        child: Opacity(opacity: isEnabled ? 1.0 : 0.6, child: child),
      ),
    );
  }
}
