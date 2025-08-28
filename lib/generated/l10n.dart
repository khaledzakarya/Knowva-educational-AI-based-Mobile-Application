// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Knowva`
  String get onboardingTitle1 {
    return Intl.message(
      'Welcome to Knowva',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Smart teaching starts here save time, teach better, and engage your students like never before.`
  String get onboardingDescription1 {
    return Intl.message(
      'Smart teaching starts here save time, teach better, and engage your students like never before.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Personalized Learning`
  String get onboardingTitle2 {
    return Intl.message(
      'Personalized Learning',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Help every student succeed with targeted feedback and adaptive learning recommendations.`
  String get onboardingDescription2 {
    return Intl.message(
      'Help every student succeed with targeted feedback and adaptive learning recommendations.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Ready to Transform Your Classroom?`
  String get onboardingTitle3 {
    return Intl.message(
      'Ready to Transform Your Classroom?',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Join Knowva today and experience the future of teaching.`
  String get onboardingDescription3 {
    return Intl.message(
      'Join Knowva today and experience the future of teaching.',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get button_next {
    return Intl.message(
      'Next',
      name: 'button_next',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get button_start {
    return Intl.message(
      'Start now',
      name: 'button_start',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get language_en {
    return Intl.message(
      'EN',
      name: 'language_en',
      desc: '',
      args: [],
    );
  }

  /// `AR`
  String get language_ar {
    return Intl.message(
      'AR',
      name: 'language_ar',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get login_title {
    return Intl.message(
      'Welcome Back!',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Smart teaching starts here.`
  String get login_subtitle {
    return Intl.message(
      'Smart teaching starts here.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login_button {
    return Intl.message(
      'Log in',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_create_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email {
    return Intl.message(
      'Email address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign in with`
  String get or_sign_in_with {
    return Intl.message(
      'Or Sign in with',
      name: 'or_sign_in_with',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
