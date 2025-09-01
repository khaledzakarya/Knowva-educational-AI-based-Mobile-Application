import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/presentation/screens/auth/choose_role_screen.dart';
import 'package:knowva/presentation/screens/auth/forget_password.dart';
import 'package:knowva/presentation/screens/auth/login_screen.dart';
import 'package:knowva/presentation/screens/auth/otp_screen.dart';
import 'package:knowva/presentation/screens/auth/reset_password.dart';
import 'package:knowva/presentation/screens/auth/signup_screen.dart';
import 'package:knowva/presentation/screens/navigation_menu.dart';
import 'package:knowva/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:knowva/presentation/screens/splash/splash_screen.dart';
import 'package:knowva/presentation/screens/teatcher/home_screen.dart';

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
    GoRoute(
      path: AppRoutes.otp,
      pageBuilder: (context, state) => const MaterialPage(child: OTPScreen()),
    ),
    GoRoute(
      path: AppRoutes.resetPass,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ResetPasswordScreen()),
    ),
    GoRoute(
      path: AppRoutes.signup,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignupScreen()),
    ),

    GoRoute(
      path: AppRoutes.chooseRole,
      builder: (context, state) => ChooseRoleScreen(),
    ),

    GoRoute(
      path: AppRoutes.navigationMenu,
      builder: (context, state) => NavigationMenu(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
