import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/widgets/Auth/top_circle_decoration.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';
import 'package:knowva/routes/app_routes.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    /// Initialize MySizes for responsiveness
    MySizes.init(context);
    getDeviceType(MediaQuery.of(context));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Top Decoration
            const TopCircleDecoration(),

            Padding(
              padding: EdgeInsets.all(MySizes.paddingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    S.of(context).choose_your_role, // "choose your role"
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: MySizes.headlineLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceXs),

                  /// Subtitle
                  Text(
                    S.of(context).choose_role_subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MySizes.labelMedium,
                    ),
                  ),
                  SizedBox(height: MySizes.spaceLg),

                  /// Role Selection (Teacher / Student)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _buildRoleCard(
                          context,
                          role: S.of(context).teacher,
                          image: MyImages.teacher,
                        ),
                      ),
                      SizedBox(width: MySizes.spaceSm),
                      Expanded(
                        child: _buildRoleCard(
                          context,
                          role: S.of(context).student,
                          image: MyImages.student,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.spaceLg),

                  /// Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: GradientElevatedButton(
                      onPressed: selectedRole == null
                          ? null
                          : () {
                              context.push(AppRoutes.signup);
                            },
                      padding: EdgeInsets.symmetric(
                        vertical: MySizes.paddingSm,
                        horizontal: MySizes.paddingMd,
                      ),
                      gradientColors: MyColors.blueGradient,
                      borderRadius: MySizes.borderRadiusSm,
                      child: Text(
                        S.of(context).continue_text, // "Continue"
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.light,
                          fontSize: MySizes.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String role,
    required String image,
  }) {
    final isSelected = selectedRole == role;
    final isDark = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: Container(
        padding: EdgeInsets.all(MySizes.paddingSm),
        decoration: BoxDecoration(
          gradient: isSelected ? MyColors.orangeGradient : null,
          color: isSelected
              ? null
              : isDark
              ? MyColors.darkGrey
              : MyColors.lightGrey,
          borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
          border: Border.all(
            color: isSelected
                ? MyColors.secondaryColor
                : isDark
                ? MyColors.grey
                : MyColors.darkGrey.withValues(alpha: 0.6),
            width: MySizes.borderWidthSm,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: MySizes.spaceSm,
              offset: Offset(0, MySizes.spaceXs),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: MySizes.imageHeightLarge,
              width: MySizes.imageHeightXXLarge,
            ),
            SizedBox(height: MySizes.spaceSm),
            Text(
              role,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: MySizes.headlineMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
