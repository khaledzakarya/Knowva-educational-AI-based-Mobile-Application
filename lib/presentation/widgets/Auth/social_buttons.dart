import 'package:flutter/material.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_outlined_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: isDark ? MyColors.grey : MyColors.textSecondary,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                S.of(context).or_sign_in_with,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: MySizes.bodySmall),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: isDark ? MyColors.grey : MyColors.textSecondary,
              ),
            ),
          ],
        ),
        SizedBox(height: MySizes.spaceSm),
        Row(
          children: [
            Expanded(
              child: GradientOutlinedButton(
                borderRadius: MySizes.borderRadiusSm,
                padding: EdgeInsets.symmetric(
                  horizontal: MySizes.paddingMd,
                  vertical: MySizes.paddingSm,
                ),
                onPressed: () {},
                child: Image(
                  image: AssetImage(MyImages.google),
                  height: MySizes.screenWidth * 0.075,
                ),
              ),
            ),
            SizedBox(width: MySizes.spaceSm),
            Expanded(
              child: GradientOutlinedButton(
                borderRadius: MySizes.borderRadiusSm,
                padding: EdgeInsets.symmetric(
                  horizontal: MySizes.paddingMd,
                  vertical: MySizes.paddingSm,
                ),
                onPressed: () {},
                child: Image(
                  image: AssetImage(MyImages.facebook),
                  height: MySizes.screenWidth * 0.075,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
