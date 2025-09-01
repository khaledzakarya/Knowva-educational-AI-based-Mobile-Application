import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:knowva/core/functions/get_device_type.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/domain/entites/onboarding_entity.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';
import 'package:knowva/presentation/controllers/onboarding/onboarding_controller.dart';
import 'package:knowva/presentation/widgets/onboardding/language_toggle_button.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_elevation_butoon.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List onboardingData = [
      OnboardingEntity(
        image: MyImages.onboarding1,
        title: S.of(context).onboardingTitle1,
        description: S.of(context).onboardingDescription1,
      ),
      OnboardingEntity(
        image: MyImages.onboarding2,
        title: S.of(context).onboardingTitle2,
        description: S.of(context).onboardingDescription2,
      ),
      OnboardingEntity(
        image: MyImages.onboarding3,
        title: S.of(context).onboardingTitle3,
        description: S.of(context).onboardingDescription3,
      ),
    ];
    final languageController = sl.get<LanguageController>();
    final isArabic = languageController.locale.languageCode == 'ar';
    final controller = sl.get<OnboardingController>();
    final deviceType = getDeviceType(MediaQuery.of(context));
    MySizes.init(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) => controller.currentPage.value = value,
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 2
                        ? Image(
                            image: AssetImage(MyImages.onboarding3),
                            height: MySizes.imageHeightXLarge,
                            width: MySizes.imageWidthXXLarge,
                          )
                        : SvgPicture.asset(
                            onboardingData[index].image,
                            height: MySizes.imageHeightXLarge,
                            width: MySizes.imageWidthXLarge,
                          ),
                    SizedBox(height: MySizes.spaceMd),
                    Text(
                      onboardingData[index].title,
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(fontSize: MySizes.headlineSmall),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MySizes.spaceMd),
                    Text(
                      onboardingData[index].description,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: MySizes.bodyMedium,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Obx(() {
            bool isLast =
                controller.currentPage.value == onboardingData.length - 1;
            return Positioned(
              bottom: 48,

              right: isArabic ? null : 36,
              left: isArabic ? 36 : null,
              child: GradientElevatedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: MySizes.paddingMd,
                  vertical: isLast ? MySizes.paddingSm : MySizes.paddingMd,
                ),
                borderRadius: MySizes.borderRadiusSm,
                onPressed: () => controller.nextPage(context),
                child: isLast
                    ? Text(
                        S.of(context).button_start,
                        style: Theme.of(context).textTheme.bodyLarge!
                            .apply(color: MyColors.light)
                            .copyWith(fontSize: MySizes.bodyLarge),
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: MyColors.white,
                        size: MySizes.iconMedium,
                      ),
              ),
            );
          }),

          Positioned(
            bottom: 60,
            left: isArabic ? null : 36,
            right: isArabic ? 36 : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MySizes.smallSpaceXl,
                    ),
                    width: MySizes.iconSmall,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: index == controller.currentPage.value
                          ? MyColors.secondaryColor
                          : MyColors.secondaryColor.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Obx(() {
            if (controller.currentPage.value != onboardingData.length - 1) {
              return Positioned(
                top: 80,
                right: isArabic ? null : 30,
                left: isArabic ? 30 : null,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => controller.skip(),
                    child: Text(
                      S.of(context).skip,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: MySizes.bodySmall,
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          Positioned(
            top: 80,
            left: isArabic ? null : 30,
            right: isArabic ? 30 : null,
            child: Align(
              alignment: Alignment.bottomRight,
              child: LanguageToggleButton(
                width: MySizes.buttonWidthXs,
                height: deviceType == DeviceType.tablet
                    ? MySizes.buttonHeightMd
                    : MySizes.buttonHeightXs,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
