import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/common/my_app_bar.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/presentation/widgets/styles/gradient_text_field.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).reset_password),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.paddingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                MyImages.resetPassword,
                alignment: Alignment.center,
                height: MySizes.imageHeightLarge,
                width: MySizes.imageWidthXXLarge,
              ),
            ),
            SizedBox(height: MySizes.spaceLg),
            Text(
              S.of(context).enter_new_password,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: MySizes.headlineMedium,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MySizes.spaceXs),
            Text(
              S.of(context).enter_new_password_subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: MySizes.bodyLarge),
            ),
            SizedBox(height: MySizes.spaceMd),
            GradientBorderTextField(
              hintText: S.of(context).password,
              borderWidth: MySizes.borderWidthXs,
              borderRadius: MySizes.borderRadiusSm,
              prefixIcon: HugeIcons.strokeRoundedSquareLock02,
              isPassword: true,
            ),
            SizedBox(height: MySizes.spaceSm),
            GradientBorderTextField(
              hintText: S.of(context).confirm_password,
              borderWidth: MySizes.borderWidthXs,
              borderRadius: MySizes.borderRadiusSm,
              prefixIcon: HugeIcons.strokeRoundedSquareLock02,
              isPassword: true,
            ),
            SizedBox(height: MySizes.spaceLg),
            SizedBox(
              width: double.infinity,
              child: GradientElevatedButton(
                borderRadius: MySizes.borderRadiusSm,
                onPressed: () {
                  // handle sending otp email
                  // context.push(AppRoutes.otp);
                  showCustomDialog(context);
                },
                child: Text(
                  S.of(context).reset_password,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: MySizes.titleLarge,
                    color: MyColors.light,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final isDark = MyHelperFunctions.isDarkMode(context);
      MySizes.init(context);
      return AlertDialog(
        backgroundColor: isDark ? MyColors.dark : MyColors.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
        ),
        title: LottieBuilder.asset(MyImages.successAnimation),
        content: Text(
          S.of(context).the_password_have_reset_successfully,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: MySizes.titleLarge),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: GradientElevatedButton(
              borderRadius: MySizes.borderRadiusSm,
              onPressed: () {
                context.pop();
              },
              child: Text(
                S.of(context).done,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: MySizes.titleLarge,
                  color: MyColors.light,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
