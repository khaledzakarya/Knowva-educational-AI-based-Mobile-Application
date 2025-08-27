import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/presentation/screens/home_page.dart';

import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
  ],
);
