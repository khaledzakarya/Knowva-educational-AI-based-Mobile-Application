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

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry `
  String get dont_worry {
    return Intl.message(
      'Don\'t worry ',
      name: 'dont_worry',
      desc: '',
      args: [],
    );
  }

  /// `we’ll guide you through a quick and secure process to get you back into your account.`
  String get forget_password_description {
    return Intl.message(
      'we’ll guide you through a quick and secure process to get you back into your account.',
      name: 'forget_password_description',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email `
  String get enter_email {
    return Intl.message(
      'Enter your Email ',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `We’ll send you a code to reset your password.`
  String get enter_email_subtitle {
    return Intl.message(
      'We’ll send you a code to reset your password.',
      name: 'enter_email_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get send_code {
    return Intl.message(
      'Send code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code`
  String get enter_code {
    return Intl.message(
      'Enter the code',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit code sent to your email address.`
  String get enter_code_subtitle {
    return Intl.message(
      'Enter the 4-digit code sent to your email address.',
      name: 'enter_code_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get enter_new_password {
    return Intl.message(
      'Enter your new password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password to complete the process.`
  String get enter_new_password_subtitle {
    return Intl.message(
      'Enter new password to complete the process.',
      name: 'enter_new_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started!`
  String get get_started {
    return Intl.message(
      'Get Started!',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Enter your information and enjoy smart learning.`
  String get signup_subtitle {
    return Intl.message(
      'Enter your information and enjoy smart learning.',
      name: 'signup_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Accept our`
  String get Accept_our {
    return Intl.message(
      'Accept our',
      name: 'Accept_our',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `The password has been reset successfully.`
  String get the_password_have_reset_successfully {
    return Intl.message(
      'The password has been reset successfully.',
      name: 'the_password_have_reset_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Didn't get the code?`
  String get didnt_get_code {
    return Intl.message(
      'Didn\'t get the code?',
      name: 'didnt_get_code',
      desc: '',
      args: [],
    );
  }

  /// `Send again`
  String get send_again {
    return Intl.message(
      'Send again',
      name: 'send_again',
      desc: '',
      args: [],
    );
  }

  /// `Choose your role`
  String get choose_your_role {
    return Intl.message(
      'Choose your role',
      name: 'choose_your_role',
      desc: '',
      args: [],
    );
  }

  /// `choose the role you want to continue your journey with.`
  String get choose_role_subtitle {
    return Intl.message(
      'choose the role you want to continue your journey with.',
      name: 'choose_role_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_text {
    return Intl.message(
      'Continue',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Teacher`
  String get teacher {
    return Intl.message(
      'Teacher',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Hi Mr, {userName}!`
  String home_welcome(Object userName) {
    return Intl.message(
      'Hi Mr, $userName!',
      name: 'home_welcome',
      desc: '',
      args: [userName],
    );
  }

  /// `Ready to inspire your students today?`
  String get home_welcome_subtitle {
    return Intl.message(
      'Ready to inspire your students today?',
      name: 'home_welcome_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Classes`
  String get classes {
    return Intl.message(
      'Classes',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Materials`
  String get materials {
    return Intl.message(
      'Materials',
      name: 'materials',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quick_actions {
    return Intl.message(
      'Quick Actions',
      name: 'quick_actions',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Upload Material`
  String get upload_material {
    return Intl.message(
      'Upload Material',
      name: 'upload_material',
      desc: '',
      args: [],
    );
  }

  /// `New Exam`
  String get new_exam {
    return Intl.message(
      'New Exam',
      name: 'new_exam',
      desc: '',
      args: [],
    );
  }

  /// `Manage Students`
  String get manage_students {
    return Intl.message(
      'Manage Students',
      name: 'manage_students',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `AI Suggestions`
  String get ai_suggestions {
    return Intl.message(
      'AI Suggestions',
      name: 'ai_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `40% of students struggled in Exam last week.`
  String get ai_suggest {
    return Intl.message(
      '40% of students struggled in Exam last week.',
      name: 'ai_suggest',
      desc: '',
      args: [],
    );
  }

  /// `Make a revision on the last lesson.`
  String get ai_suggest_detail {
    return Intl.message(
      'Make a revision on the last lesson.',
      name: 'ai_suggest_detail',
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
