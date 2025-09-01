import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/presentation/controllers/navigation/navigation_menu_controller.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_icon.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.index,
  });

  final NavigationController controller;
  final IconData icon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isDark = MyHelperFunctions.isDarkMode(context);
    MySizes.init(context);

    return Obx(() {
      final bool isSelected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => controller.selectedIndex.value = index,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MySizes.paddingMd,
            vertical: MySizes.paddingSm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
            color: isSelected
                ? (isDark
                      ? MyColors.darkOrange.withValues(alpha: 0.2)
                      : MyColors.white.withValues(alpha: 0.2))
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientIcon(
                icon: icon,
                gradient: isDark ? MyColors.orangeGradient : null,
                isGradient: isDark,
                color: MyColors.light,
                size: MySizes.iconMedium,
              ),
              if (isSelected) ...[
                SizedBox(width: MySizes.spaceXs),
                isDark
                    ? GradientText(
                        text: label,
                        gradient: MyColors.orangeGradient,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: MySizes.titleSmall,
                        ),
                      )
                    : Text(
                        label,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: MySizes.titleSmall,
                          color: MyColors.light,
                        ),
                      ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
