import 'package:flutter/material.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    MySizes.init(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MySizes.paddingMd),
      decoration: BoxDecoration(
        color: isDark ? MyColors.darkContainer : MyColors.white,
        borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
        border: Border.all(color: MyColors.darkGrey),
        boxShadow: [
          BoxShadow(
            color: !isDark ? Colors.black26 : Colors.black45,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
