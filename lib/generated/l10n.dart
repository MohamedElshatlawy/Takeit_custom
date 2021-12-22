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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No internet connection, please check you network and try again`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection, please check you network and try again',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server Error`
  String get internal_server_error {
    return Intl.message(
      'Internal Server Error',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
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
  String get conf_password {
    return Intl.message(
      'Confirm Password',
      name: 'conf_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account ? Signup Now`
  String get signup_now {
    return Intl.message(
      'Don\'t have account ? Signup Now',
      name: 'signup_now',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get signup {
    return Intl.message(
      'Register',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `verifiy`
  String get verifiy {
    return Intl.message(
      'verifiy',
      name: 'verifiy',
      desc: '',
      args: [],
    );
  }

  /// `assets/images/LogoEnglish.jpg`
  String get logoImage {
    return Intl.message(
      'assets/images/LogoEnglish.jpg',
      name: 'logoImage',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Fast Food`
  String get fastFood {
    return Intl.message(
      'Fast Food',
      name: 'fastFood',
      desc: '',
      args: [],
    );
  }

  /// `Sandwiches`
  String get sandwiches {
    return Intl.message(
      'Sandwiches',
      name: 'sandwiches',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Food`
  String get aribianFood {
    return Intl.message(
      'Arabian Food',
      name: 'aribianFood',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get booking {
    return Intl.message(
      'Book Now',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Available Booking Times`
  String get avaliableTime {
    return Intl.message(
      'Available Booking Times',
      name: 'avaliableTime',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `personal Account`
  String get personalAccount {
    return Intl.message(
      'personal Account',
      name: 'personalAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Name`
  String get enterTheName {
    return Intl.message(
      'Enter The Name',
      name: 'enterTheName',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Phone Number`
  String get enterThePhoneNo {
    return Intl.message(
      'Enter The Phone Number',
      name: 'enterThePhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Password Correctly`
  String get enterThePassCorrectly {
    return Intl.message(
      'Enter The Password Correctly',
      name: 'enterThePassCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Reservations`
  String get reservations {
    return Intl.message(
      'Reservations',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get status {
    return Intl.message(
      'Accepted',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Name`
  String get restaurantName {
    return Intl.message(
      'Restaurant Name',
      name: 'restaurantName',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Address`
  String get restaurantAddress {
    return Intl.message(
      'Restaurant Address',
      name: 'restaurantAddress',
      desc: '',
      args: [],
    );
  }

  /// `person`
  String get person {
    return Intl.message(
      'person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
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

  /// `You can Edit The reservation Before 08:00`
  String get reserveEdit {
    return Intl.message(
      'You can Edit The reservation Before 08:00',
      name: 'reserveEdit',
      desc: '',
      args: [],
    );
  }

  /// `You can Cancel The reservation Before 08:00`
  String get reserveCancel {
    return Intl.message(
      'You can Cancel The reservation Before 08:00',
      name: 'reserveCancel',
      desc: '',
      args: [],
    );
  }

  /// `Reserve By Barcode`
  String get reserveBarCode {
    return Intl.message(
      'Reserve By Barcode',
      name: 'reserveBarCode',
      desc: '',
      args: [],
    );
  }

  /// `Add To Calender`
  String get addToCalender {
    return Intl.message(
      'Add To Calender',
      name: 'addToCalender',
      desc: '',
      args: [],
    );
  }

  /// `What 's The Occasion`
  String get occasion {
    return Intl.message(
      'What \'s The Occasion',
      name: 'occasion',
      desc: '',
      args: [],
    );
  }

  /// `BirthDays`
  String get birthDay {
    return Intl.message(
      'BirthDays',
      name: 'birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Weddings`
  String get wedding {
    return Intl.message(
      'Weddings',
      name: 'wedding',
      desc: '',
      args: [],
    );
  }

  /// `Meetings`
  String get meetings {
    return Intl.message(
      'Meetings',
      name: 'meetings',
      desc: '',
      args: [],
    );
  }

  /// `User1`
  String get userName {
    return Intl.message(
      'User1',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `waiting`
  String get waitingStatus {
    return Intl.message(
      'waiting',
      name: 'waitingStatus',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get now {
    return Intl.message(
      'Now',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Reservations Accepted`
  String get bookingAccepted {
    return Intl.message(
      'Reservations Accepted',
      name: 'bookingAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
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
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}