import 'package:get_it/get_it.dart';
import 'package:knowva/presentation/controllers/language/language_controller.dart';
import 'package:knowva/presentation/controllers/navigation/navigation_menu_controller.dart';
import 'package:knowva/presentation/controllers/onboarding/onboarding_controller.dart';

final sl = GetIt.instance;

class Di {
  static Future<void> init() async {
    sl.registerLazySingleton(() => Di());

    // controllers
    sl.registerLazySingleton(()=>OnboardingController());
    sl.registerLazySingleton(()=>LanguageController());
    sl.registerLazySingleton(()=>NavigationController());

  }
}