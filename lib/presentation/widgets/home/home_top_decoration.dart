
import 'package:flutter/material.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';
import 'package:knowva/presentation/widgets/Auth/top_circle_decoration.dart';

class HomeTopDecoration extends StatelessWidget {
  const HomeTopDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = sl.get<LanguageController>().locale.languageCode == 'ar';
    MySizes.init(context);
    return SizedBox(
      width: double.infinity,
      height: MySizes.screenHeight * 0.25,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -MySizes.screenWidth * 0.21, // adjusted for new radius
            left: isArabic ? -MySizes.screenWidth * 0.15 : null,
            right: isArabic ? null : -MySizes.screenWidth * 0.15,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.42, // was 0.376 → now bigger
              gradient: MyColors.orangeGradient,
            ),
          ),

          // Small Blue Circle (bigger)
          Positioned(
            top: MySizes.screenHeight * 0.05,
            left: isArabic ? MySizes.screenWidth * 0.09 : null,
            right: isArabic ? null : MySizes.screenWidth * 0.09,
            child: DecorationCircle(
              radius: MySizes.screenWidth * 0.15, // was 0.123 → now bigger
              gradient: MyColors.blueGradient,
            ),
          ),
        ],
      ),
    );
  }
}
