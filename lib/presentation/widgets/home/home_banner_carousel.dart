import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/core/utils/my_sizes.dart';
import 'package:knowva/di.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final List<String> bannerImagesEn = [
      isDark ? MyImages.banner1Dark : MyImages.banner1Light,
      MyImages.banner2,
      MyImages.banner3,
    ];

    final List<String> bannerImagesAr = [
      MyImages.banner1ArabicLight,
      MyImages.banner2Arabic,
      MyImages.banner3Arabic,
    ];

    final LanguageController languageController = sl.get<LanguageController>();
    final List<String> bannerImages =
        languageController.locale.languageCode == 'ar'
        ? bannerImagesAr
        : bannerImagesEn;
    MySizes.init(context);
    return CarouselSlider(
      options: CarouselOptions(
        height: MySizes.containerHeightMedium,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: MySizes.isTablet ? 0.7 : 1,
      ),
      items: bannerImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: MySizes.screenWidth - MySizes.paddingMd,
              height: MySizes.containerHeightXLarge - MySizes.paddingMd,
              child: SvgPicture.asset(imagePath),
            );
          },
        );
      }).toList(),
    );
  }
}
