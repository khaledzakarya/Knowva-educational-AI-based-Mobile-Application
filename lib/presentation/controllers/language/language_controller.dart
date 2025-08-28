import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find();
  static const String _key = 'language_code';
  final GetStorage _storage = GetStorage();

  /// Observable locale
  final Rx<Locale> _locale = const Locale('en').obs;
  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLocale();
  }

  /// Load saved locale from GetStorage
  void _loadSavedLocale() {
    final String? savedCode = _storage.read(_key);
    if (savedCode != null) {
      _locale.value = Locale(savedCode);
    }
  }

  /// Switch between EN & AR
  void toggleLanguage() {
    if (_locale.value.languageCode == 'en') {
      setLanguage(const Locale('ar'));
    } else {
      setLanguage(const Locale('en'));
    }
  }

  /// Set specific language
  void setLanguage(Locale locale) {
    _locale.value = locale;
    _storage.write(_key, locale.languageCode);
    Get.updateLocale(locale);
  }
}
