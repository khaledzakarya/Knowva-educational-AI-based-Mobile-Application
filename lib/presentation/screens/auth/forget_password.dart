import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/common/my_app_bar.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_text.dart';
import 'package:knowva/presentation/widgets/styles/gradient_text_field.dart';
import 'package:knowva/routes/app_routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).forgot_password),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySizes.paddingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySizes.spaceLg),
            Wrap(
              children: [
                GradientText(
                  text: S.of(context).dont_worry,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: MySizes.headlineSmall,
                  ),
                ),
                Text(
                  S.of(context).forget_password_description,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: MySizes.headlineSmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: MySizes.spaceXl),
            Text(
              S.of(context).enter_email,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: MySizes.headlineMedium,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MySizes.spaceXs),
            Text(
              S.of(context).enter_email_subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: MySizes.bodyLarge),
            ),
            SizedBox(height: MySizes.spaceLg),
            GradientBorderTextField(
              hintText: S.of(context).email,
              borderWidth: MySizes.borderWidthXs,
              borderRadius: MySizes.borderRadiusSm,
              prefixIcon: HugeIcons.strokeRoundedMail02,
            ),
            SizedBox(height: MySizes.spaceLg),
            SizedBox(
              width: double.infinity,
              child: GradientElevatedButton(
                borderRadius: MySizes.borderRadiusSm,
                onPressed: () {
                  // handle sending otp email
                  context.push(AppRoutes.otp);
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
          ],
        ),
      ),
    );
  }
}
