import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/routes/app_routes.dart';
import 'package:path/path.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final RxInt currentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  void nextPage(BuildContext context) {
    if (currentPage.value < 2) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.login);
    }
  }

  void skip() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
