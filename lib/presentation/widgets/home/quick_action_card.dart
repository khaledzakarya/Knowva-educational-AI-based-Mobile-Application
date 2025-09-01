import 'package:flutter/material.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(MySizes.paddingLg),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
            gradient: isDark ? null : MyColors.blueGradient,
            color: MyColors.darkContainer,
          ),
          child: Center(
            child: Icon(
              icon,
              size: MySizes.iconLarge,
              color: isDark ? MyColors.darkOrange : MyColors.light,
            ),
          ),
        ),
        SizedBox(height: MySizes.spaceSm),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: MySizes.bodySmall,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
