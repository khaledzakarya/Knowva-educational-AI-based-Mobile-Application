import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';

class LanguageToggleButton extends StatelessWidget {
  final double width;
  final double height;
  const LanguageToggleButton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final languageController = sl.get<LanguageController>();

    return Obx(() {
      final isEnglish = languageController.locale.languageCode == 'en';

      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: MyColors.grey,
          borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildOption(
                context: context,
                controller: languageController,
                label: S.of(context).language_en,
                isActive: isEnglish,
              ),
            ),
            Expanded(
              child: _buildOption(
                context: context,
                controller: languageController,
                label: S.of(context).language_ar,
                isActive: !isEnglish,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildOption({
    required BuildContext context,
    required LanguageController controller,
    required String label,
    required bool isActive,
  }) {
    MySizes.init(context);
    return GestureDetector(
      onTap: () => controller.toggleLanguage(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.all(MySizes.paddingXs / 2),
        decoration: BoxDecoration(
          gradient: isActive ? MyColors.blueGradient : null,
          color: isActive ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(MySizes.borderRadiusXs),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isActive ? MyColors.light : MyColors.dark,
            fontSize: MySizes.labelMedium,
          ),
        ),
      ),
    );
  }
}
