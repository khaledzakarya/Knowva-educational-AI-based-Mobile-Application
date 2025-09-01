import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/controllers/navigation/navigation_menu_controller.dart';
import 'package:knowva/presentation/widgets/navigation_menu/bottom_nav_item.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final controller = sl.get<NavigationController>();
    MySizes.init(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(MySizes.paddingMd),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySizes.borderRadiusSm),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? MyColors.darkOrange.withValues(alpha: 0.3)
                    : Colors.black54,
                blurRadius: 10,
                offset: const Offset(4, 6),
              ),
            ],
          ),
          child: Container(
            color: isDark ? MyColors.darkNav : MyColors.lightNav,
            padding: EdgeInsets.symmetric(
              horizontal: MySizes.paddingMd,
              vertical: MySizes.paddingSm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(
                  controller: controller,
                  icon: HugeIcons.strokeRoundedHome05,
                  label: S.of(context).home,
                  index: 0,
                ),
                BottomNavItem(
                  controller: controller,
                  icon: HugeIcons.strokeRoundedBrain,
                  label: S.of(context).exams,
                  index: 1,
                ),
                BottomNavItem(
                  controller: controller,
                  icon: HugeIcons.strokeRoundedMessage01,
                  label: S.of(context).chat,
                  index: 2,
                ),
                BottomNavItem(
                  controller: controller,
                  icon: HugeIcons.strokeRoundedAccountSetting01,
                  index: 3,
                  label: S.of(context).settings,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
