import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';

class MyReturnButton extends StatelessWidget {
  const MyReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    final isDark = MyHelperFunctions.isDarkMode(context);
    final languageController = sl.get<LanguageController>();
    final isArabic = languageController.locale.languageCode == 'ar';

    return IconButton(
      icon: Icon(
        isArabic
            ? HugeIcons.strokeRoundedArrowRight01
            : HugeIcons.strokeRoundedArrowLeft01,
        size: MySizes.iconLarge,
        color: isDark ? MyColors.textWhite : MyColors.textPrimary,
      ),
      onPressed: () {
        context.pop();
      },
    );
  }
}
