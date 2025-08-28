import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/Auth/remember_me.dart';
import 'package:knowva/presentation/widgets/Auth/social_buttons.dart';
import 'package:knowva/presentation/widgets/Auth/top_circle_decoration.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';
import 'package:knowva/presentation/widgets/styles/gradient_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopCircleDecoration(),
            Padding(
              padding: EdgeInsets.all(MySizes.paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).login_title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: MySizes.headlineLarge,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceXs),
                  Text(
                    S.of(context).login_subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MySizes.labelMedium,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceLg),

                  /// Email
                  GradientBorderTextField(
                    hintText: S.current.email,
                    prefixIcon: Iconsax.send_1,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),
                  SizedBox(height: MySizes.spaceXs),

                  /// Password
                  GradientBorderTextField(
                    isPassword: true,
                    hintText: S.current.password,
                    prefixIcon: Iconsax.lock,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),

                  /// Remember me + Forgot password
                  RememberMe(),
                  SizedBox(height: MySizes.spaceSm),

                  /// Log in Button
                  SizedBox(
                    width: double.infinity,
                    child: GradientElevatedButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(
                        vertical: MySizes.paddingSm,
                        horizontal: MySizes.paddingMd,
                      ),
                      gradientColors: MyColors.blueGradient,
                      borderRadius: MySizes.borderRadiusSm,
                      child: Text(
                        S.current.login_button,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.light,
                          fontSize: MySizes.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Or sign in with
                  SocialButtons(),
                  SizedBox(height: MySizes.spaceXs),

                  /// Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).login_create_account,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: MySizes.bodySmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: GradientText(
                          text: S.of(context).signup,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                fontSize: MySizes.bodySmall,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
