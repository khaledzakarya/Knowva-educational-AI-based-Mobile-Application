import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowva/core/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:knowva/di.dart';
import 'package:knowva/generated/l10n.dart';
import 'package:knowva/routes/app_router.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();
  
  await GetStorage.init();
  await Di.init();

  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
      supportedLocales: S.delegate.supportedLocales,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
