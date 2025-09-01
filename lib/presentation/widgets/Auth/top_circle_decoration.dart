import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';

class TopCircleDecoration extends StatelessWidget {
  const TopCircleDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(MediaQuery.of(context));
    final isPhone = deviceType == DeviceType.phone;
    final isSmallPhone =
        deviceType == DeviceType.phone && MySizes.screenHeight < 700;
    double baseHeight = isPhone
        ? isSmallPhone
              ? MySizes.screenHeight * 0.21
              : MySizes.screenHeight * 0.32
        : MySizes.screenHeight * 0.24;

    double shiftUp = isPhone
        ? isSmallPhone
              ? MySizes.screenHeight * 0.07
              : MySizes.screenHeight * 0.00
        : MySizes.screenHeight * 0.15;

    return SizedBox(
      height: baseHeight,
      width: MySizes.screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: MySizes.screenHeight * 0.037 - shiftUp,
            left: MySizes.screenWidth * 0.35,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.4,
              gradient: MyColors.blueGradient,
            ),
          ),
          Positioned(
            top: MySizes.screenHeight * -0.148 - shiftUp,
            left: MySizes.screenWidth * 0.5,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.7,
              gradient: MyColors.orangeGradient,
            ),
          ),
          Positioned(
            top: MySizes.screenHeight * 0.139 - shiftUp,
            left: MySizes.screenWidth * -0.15,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.26,
              gradient: MyColors.orangeGradient,
            ),
          ),
          Positioned(
            top: MySizes.screenHeight * 0.21 - shiftUp,
            left: MySizes.screenWidth * 0.052,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.09,
              gradient: MyColors.blueGradient,
            ),
          ),
        ],
      ),
    );
  }
}

/// Decoration Circle
class DecorationCircle extends StatelessWidget {
  const DecorationCircle({
    super.key,
    required this.radius,
    required this.gradient,
  });
  final double radius;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 4)),
        ],
      ),
    );
  }
}
