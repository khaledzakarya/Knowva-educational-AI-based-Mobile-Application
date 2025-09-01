import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_colors.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';
import 'package:knowva/presentation/widgets/Auth/top_circle_decoration.dart';
import 'package:knowva/presentation/widgets/common/my_card.dart';
import 'package:knowva/presentation/widgets/common/my_list_tile.dart';
import 'package:knowva/presentation/widgets/common/profile_image.dart';
import 'package:knowva/presentation/widgets/home/home_banner_carousel.dart';
import 'package:knowva/presentation/widgets/home/home_top_bar.dart';
import 'package:knowva/presentation/widgets/home/home_top_decoration.dart';
import 'package:knowva/presentation/widgets/home/info_card_item.dart';
import 'package:knowva/presentation/widgets/home/quick_action_card.dart';
import 'package:knowva/presentation/widgets/styles/gradiant_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySizes.init(context);
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HomeTopDecoration(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(MySizes.paddingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeTopBar(),
                    SizedBox(height: MySizes.spaceLg),
                    MyCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoCardItem(
                            icon: HugeIcons.strokeRoundedSchool,
                            count: "6",
                            title: S.of(context).classes,
                          ),
                          InfoCardItem(
                            icon: HugeIcons.strokeRoundedBookOpen01,
                            count: "10",
                            title: S.of(context).materials,
                          ),
                          InfoCardItem(
                            icon: HugeIcons.strokeRoundedUser02,
                            count: "125",
                            title: S.of(context).students,
                          ),
                          InfoCardItem(
                            icon: HugeIcons.strokeRoundedNote,
                            count: "6",
                            title: S.of(context).exams,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    BannerCarousel(),
                    SizedBox(height: MySizes.spaceSm),
                    Text(
                      S.of(context).quick_actions,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: MySizes.headlineMedium),
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuickActionsCard(
                          title: S.of(context).upload_material,
                          icon: HugeIcons.strokeRoundedBookUpload,
                        ),
                        QuickActionsCard(
                          title: S.of(context).new_exam,
                          icon: HugeIcons.strokeRoundedTaskAdd01,
                        ),
                        QuickActionsCard(
                          title: S.of(context).manage_students,
                          icon: HugeIcons.strokeRoundedUserSettings01,
                        ),
                        QuickActionsCard(
                          title: S.of(context).analytics,
                          icon: HugeIcons.strokeRoundedChartLineData02,
                        ),
                      ],
                    ),
                    SizedBox(height: MySizes.spaceMd),
                    Text(
                      S.of(context).upcoming,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: MySizes.headlineMedium),
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    MyListTile(
                      title: "Group 1 exam",
                      subtitle: "Tommorrow, 10:00 AM",
                      leadingIcon: HugeIcons.strokeRoundedCalendar02,
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    MyListTile(
                      title: "Group 1 exam",
                      subtitle: "Tommorrow, 10:00 AM",
                      leadingIcon: HugeIcons.strokeRoundedCalendar02,
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    MyListTile(
                      title: "Group 1 exam",
                      subtitle: "Tommorrow, 10:00 AM",
                      leadingIcon: HugeIcons.strokeRoundedCalendar02,
                    ),
                    SizedBox(height: MySizes.spaceMd),
                    Row(
                      children: [
                        Text(
                          S.of(context).ai_suggestions,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontSize: MySizes.headlineMedium),
                        ),
                        SizedBox(width: MySizes.smallSpaceLg),
                        Icon(
                          HugeIcons.strokeRoundedRobotic,
                          size: MySizes.iconLarge - MySizes.paddingXs,
                        ),
                      ],
                    ),
                    SizedBox(height: MySizes.spaceSm),
                    MyListTile(
                      title: S.of(context).ai_suggest,
                      subtitle: S.of(context).ai_suggest_detail,
                      showBorders: false,
                      showTrailing: false,
                      leadingIcon: HugeIcons.strokeRoundedAiBrain03,
                      isGradientIcon: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
