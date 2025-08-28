import 'package:flutter/material.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Gradient gradient;
  final double borderRadius;
  final EdgeInsets padding;
  final Widget child;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    this.gradient = MyColors.orangeGradient,
    this.borderRadius = 60.0,
    this.padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isDark ? MyColors.dark : MyColors.light,
          borderRadius: BorderRadius.circular(borderRadius - 2),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius - 2),
            ),
            side: BorderSide.none,
          ),
          child: child,
        ),
      ),
    );
  }
}
