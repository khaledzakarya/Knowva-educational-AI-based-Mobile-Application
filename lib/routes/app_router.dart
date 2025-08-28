import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/presentation/screens/auth/forget_password.dart';
import 'package:knowva/presentation/screens/auth/login_screen.dart';
import 'package:knowva/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:knowva/presentation/screens/spash/splash_screen.dart';

import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      pageBuilder: (context, state) =>
          const MaterialPage(child: OnboardingScreen()),
    ),
    GoRoute(
      path: AppRoutes.splash,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SplashScreen()),
    ),
    GoRoute(
      path: AppRoutes.login,
      pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ForgetPasswordScreen()),
    ),
  ],
);
