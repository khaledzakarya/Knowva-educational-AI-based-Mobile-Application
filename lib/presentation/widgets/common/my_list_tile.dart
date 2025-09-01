import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_icon.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final bool showBorders;
  final bool showTrailing;
  final bool isGradientIcon;
  const MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    this.trailingIcon = HugeIcons.strokeRoundedArrowRight01,
    this.showBorders = false,
    this.showTrailing = true,
    this.isGradientIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySizes.paddingMd,
        vertical: MySizes.paddingSm,
      ),
      decoration: BoxDecoration(
        color: isDark ? MyColors.darkContainer : MyColors.white,
        borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
        border: showBorders
            ? Border.all(color: MyColors.darkGrey, width: MySizes.borderWidthSm)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withValues(alpha: 0.2), // softer shadow
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading Icon
          GradientIcon(
            icon: leadingIcon,
            color: MyColors.primaryColor,
            size: MySizes.iconLarge,
            isGradient: isGradientIcon,
            gradient: isGradientIcon ? MyColors.blueGradient : null,
          ),
          SizedBox(width: MySizes.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: MySizes.titleMedium,
                  ),
                ),
                SizedBox(height: MySizes.spaceXs),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: MySizes.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          if (showTrailing)
            // Trailing Icon
            GradientIcon(
              icon: trailingIcon,
              color: MyColors.primaryColor,
              size: MySizes.iconLarge,
              isGradient: isGradientIcon,
              gradient: isGradientIcon ? MyColors.blueGradient : null,
            ),
        ],
      ),
    );
  }
}
