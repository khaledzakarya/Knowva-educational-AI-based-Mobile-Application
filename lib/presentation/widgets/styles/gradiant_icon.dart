import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_colors.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    super.key,
    required this.icon,
    this.size = 20,
    this.gradient = MyColors.blueGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(icon, weight: 600, size: size, color: Colors.white),
    );
  }
}
