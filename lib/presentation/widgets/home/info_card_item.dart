import 'package:flutter/material.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_icon.dart';

class InfoCardItem extends StatelessWidget {
  const InfoCardItem({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
  });

  final String title;
  final String count;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    MySizes.init(context);
    return Column(
      spacing: MySizes.smallSpaceMd,
      children: [
        GradientIcon(
          icon: icon,
          size: MySizes.iconLarge - MySizes.paddingXs,
          gradient: isDark ? MyColors.orangeGradient : MyColors.blueGradient,
        ),
        Text(
          count,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: MySizes.headlineMedium,
          ),
        ),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontSize: MySizes.titleSmall),
        ),
      ],
    );
  }
}
