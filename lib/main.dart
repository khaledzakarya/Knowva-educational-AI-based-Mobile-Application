import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowva/core/theme/custom_themes/text_theme.dart';
import 'package:knowva/core/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:knowva/di.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';
import 'package:knowva/routes/app_router.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await GetStorage.init();
  await Di.init();

  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment(
        'dart.vm.product',
      ), // Disable in release mode
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = sl<LanguageController>();

    return Obx(() {
      final currentLocale = languageController.locale;
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Knowva',
        themeMode: ThemeMode.system,
        theme: MyAppTheme.lightTheme.copyWith(
          textTheme: MyTextTheme.getLightTextTheme(currentLocale),
        ),
        darkTheme: MyAppTheme.darkTheme.copyWith(
          textTheme: MyTextTheme.getDarkTextTheme(currentLocale),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) => locale,
        
        routerConfig: router,
        supportedLocales: S.delegate.supportedLocales,
        locale: currentLocale,
        builder: DevicePreview.appBuilder,
      );
    });
  }
}
