// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/common/my_app_bar.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';
import 'package:knowva/presentation/widgets/styles/gradient_otp.dart';
import 'package:knowva/routes/app_routes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
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
                MyImages.otp,
                alignment: Alignment.center,
                height: MySizes.imageHeightLarge,
                width: MySizes.imageWidthXXLarge,
              ),
            ),
            SizedBox(height: MySizes.spaceLg),
            Text(
              S.of(context).enter_code,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: MySizes.headlineMedium,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MySizes.spaceXs),
            Text(
              S.of(context).enter_code_subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: MySizes.bodyLarge),
            ),
            SizedBox(height: MySizes.spaceLg),
            GradientOtpField(
              boxMaxSize: MySizes.buttonHeightLg,
              gradient: MyColors.orangeGradient,
              boxRadius: MySizes.borderRadiusSm,
              boxMargin: EdgeInsets.all(MySizes.paddingSm),
              boxBackgroundColor: isDark ? MyColors.dark : MyColors.light,
              length: 4,
              textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: MySizes.headlineLarge,
              ),
              onCompleted: (value) {},
            ),
            SizedBox(height: MySizes.spaceMd),
            SizedBox(
              width: double.infinity,
              child: GradientElevatedButton(
                borderRadius: MySizes.borderRadiusSm,
                onPressed: () {
                  // handle sending otp email
                  context.push(AppRoutes.resetPass);
                },
                child: Text(
                  S.of(context).send_code,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: MySizes.titleLarge,
                    color: MyColors.light,
                  ),
                ),
              ),
            ),
            SizedBox(height: MySizes.spaceLg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).didnt_get_code,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: MySizes.bodyMedium,
                  ),
                ),
                GradientText(
                  text: S.of(context).send_again,
                  gradient: MyColors.blueGradient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: MySizes.bodyMedium,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
