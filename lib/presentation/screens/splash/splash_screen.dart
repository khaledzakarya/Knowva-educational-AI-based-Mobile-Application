import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:knowva/core/helpers/helper_functions.dart';
import 'package:knowva/core/utils/my_images.dart';
import 'package:knowva/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

    // Animation controller (controls opacity & scale)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Opacity: fades in and out
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.4,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller);

    _controller.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.go(AppRoutes.onboarding);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) => Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: isDark
                  ? Image.asset(MyImages.darkLogo, width: screenWidth - 60)
                  : Image.asset(MyImages.lightLogo, width: screenWidth - 60),
            ),
          ),
        ),
      ),
    );
  }
}
