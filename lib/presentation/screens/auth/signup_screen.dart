import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/Auth/top_circle_decoration.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';
import 'package:knowva/presentation/widgets/styles/gradient_text_field.dart';
import 'package:knowva/routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(MediaQuery.of(context));
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
                    S.of(context).get_started,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: MySizes.headlineLarge,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceXs),
                  Text(
                    S.of(context).signup_subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MySizes.labelMedium,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceLg),

                  GradientBorderTextField(
                    hintText: S.current.full_name,
                    prefixIcon: HugeIcons.strokeRoundedUser,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),
                  SizedBox(height: MySizes.spaceXs),

                  GradientBorderTextField(
                    hintText: S.current.email,
                    prefixIcon: HugeIcons.strokeRoundedMail02,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),
                  SizedBox(height: MySizes.spaceXs),

                  /// Password
                  GradientBorderTextField(
                    isPassword: true,
                    hintText: S.current.password,
                    prefixIcon: HugeIcons.strokeRoundedSquareLock02,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),
                  SizedBox(height: MySizes.spaceXs),

                  GradientBorderTextField(
                    isPassword: true,
                    hintText: S.current.confirm_password,
                    prefixIcon: HugeIcons.strokeRoundedSquareLock02,
                    borderRadius: MySizes.borderRadiusXs,
                    borderWidth: MySizes.borderWidthXs,
                  ),

                  /// Remember me + Forgot password
                  Row(
                    children: [
                      Transform.scale(
                        scale: deviceType == DeviceType.phone ? 1 : 1.5,
                        child: Checkbox(
                          value: false,
                          onChanged: (val) {},
                          activeColor: MyColors.secondaryColor,
                          side: const BorderSide(
                            color: MyColors.secondaryColor,
                          ),
                        ),
                      ),
                      Text(
                        S.current.Accept_our,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MySizes.bodyMedium,
                        ),
                      ),
                      SizedBox(width: MySizes.spaceXs),

                      GradientText(
                        text: S.current.terms,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MySizes.bodyMedium,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: MySizes.spaceXs),

                      Text(
                        S.current.and,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MySizes.bodyMedium,
                        ),
                      ),
                      SizedBox(width: MySizes.spaceXs),

                      GradientText(
                        text: S.current.privacy_policy,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MySizes.bodyMedium,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.spaceSm),

                  /// Log in Button
                  SizedBox(
                    width: double.infinity,
                    child: GradientElevatedButton(
                      onPressed: () {
                      },
                      padding: EdgeInsets.symmetric(
                        vertical: MySizes.paddingSm,
                        horizontal: MySizes.paddingMd,
                      ),
                      gradientColors: MyColors.blueGradient,
                      borderRadius: MySizes.borderRadiusSm,
                      child: Text(
                        S.current.signup,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.light,
                          fontSize: MySizes.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).already_have_account,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MySizes.bodyMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(AppRoutes.login);
                        },
                        child: GradientText(
                          text: S.of(context).login,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: MySizes.bodyMedium,
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
