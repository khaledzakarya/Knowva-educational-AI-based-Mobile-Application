import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Di {
  static Future<void> init() async {
    sl.registerLazySingleton(() => Di());
  }
}