// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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

  /// `Counter App`
  String get appTitle {
    return Intl.message(
      'Counter App',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Counter App - Home Page`
  String get pageTitle {
    return Intl.message(
      'Counter App - Home Page',
      name: 'pageTitle',
      desc: '',
      args: [],
    );
  }

  String get Number_input {
    return Intl.message(
      'Number',
      name: 'Number_input',
      desc: '',
      args: [],
    );
  }

  String get num_placeholder {
    return Intl.message(
      'Enter Your Mobile number',
      name: 'num_placeholder',
      desc: '',
      args: [],
    );
  }

  String get num_validation {
    return Intl.message(
      'Mobile number should be atleast 10 digits',
      name: 'num_validation',
      desc: '',
      args: [],
    );
  }

  //-----------------------------------------------------------------------------------------------------

  String get num_validation_2 {
    return Intl.message(
      'Mobile number can\'t be more than 10 digits',
      name: 'num_validation_2',
      desc: '',
      args: [],
    );
  }

  String get login_with_otp {
    return Intl.message(
      '"Login with OTP if you want to Login with Password turn switch off',
      name: 'login_with_otp',
      desc: '',
      args: [],
    );
  }

  String get Password_input {
    return Intl.message(
      'Password',
      name: 'Password_input',
      desc: '',
      args: [],
    );
  }

  String get password_placeholder {
    return Intl.message(
      'Enter Your Password',
      name: 'password_placeholder',
      desc: '',
      args: [],
    );
  }

  String get passw_validation {
    return Intl.message(
      'Password should be atleast 6 digits',
      name: 'Password_input',
      desc: '',
      args: [],
    );
  }

  String get can_login_with_otp {
    return Intl.message(
      'If You Forget Password you can login with otp',
      name: 'can_login_with_otp',
      desc: '',
      args: [],
    );
  }

  String get f_passw {
    return Intl.message(
      'Forget Password?',
      name: 'f_passw',
      desc: '',
      args: [],
    );
  }

  String get verify {
    return Intl.message(
      'verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  String get resend {
    return Intl.message(
      'resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  String get gen_otp {
    return Intl.message(
      'generate otp',
      name: 'gen_otp',
      desc: '',
      args: [],
    );
  }

  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  String get new_here {
    return Intl.message(
      'New Here ?',
      name: 'new_here',
      desc: '',
      args: [],
    );
  }

  String get otp_onthe_way {
    return Intl.message(
      'Auto retrieving verification code',
      name: 'otp_onthe_way',
      desc: '',
      args: [],
    );
  }

  String get something_wrong {
    return Intl.message(
      'Something has gone wrong, please try later',
      name: 'something_wrong',
      desc: '',
      args: [],
    );
  }

  String get Check_net {
    return Intl.message(
      'Please check your internet connection and try again',
      name: 'Check_net',
      desc: '',
      args: [],
    );
  }

  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  String get timeout {
    return Intl.message(
      'timeout',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  String get code_sent_to {
    return Intl.message(
      'code sent to',
      name: 'code_sent_to',
      desc: '',
      args: [],
    );
  }

  String get u_r_verified {
    return Intl.message(
      'You Are Verified',
      name: 'u_r_verified',
      desc: '',
      args: [],
    );
  }

  String get edit_resume {
    return Intl.message(
      'edit resume',
      name: 'edit_resume',
      desc: '',
      args: [],
    );
  }

  String get applied_jobs {
    return Intl.message(
      'Applied Jobs',
      name: 'applied_jobs',
      desc: '',
      args: [],
    );
  }

  String get courses {
    return Intl.message(
      'courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  String get all_co {
    return Intl.message(
      'all courses',
      name: 'all_co',
      desc: '',
      args: [],
    );
  }

  String get my_co {
    return Intl.message(
      'my courses',
      name: 'my_co',
      desc: '',
      args: [],
    );
  }

  String get know_more {
    return Intl.message(
      'know more',
      name: 'know_more',
      desc: '',
      args: [],
    );
  }

//job details

  String get apply_now {
    return Intl.message(
      'apply now',
      name: 'apply_now',
      desc: '',
      args: [],
    );
  }

  String get perks {
    return Intl.message(
      'perks',
      name: 'perks',
      desc: '',
      args: [],
    );
  }

  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  String get day_2_day {
    return Intl.message(
      'day to day task',
      name: 'day_2_day',
      desc: '',
      args: [],
    );
  }

  String get skills {
    return Intl.message(
      'skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  String get proceed_app {
    return Intl.message(
      'proceed to application',
      name: 'proceed_app',
      desc: '',
      args: [],
    );
  }

  String get edit_ur_resume {
    return Intl.message(
      'edit your resume',
      name: 'edit_ur_resume',
      desc: '',
      args: [],
    );
  }

  String get successfully_applied {
    return Intl.message(
      'You have successfully applied for this job',
      name: 'successfully_applied',
      desc: '',
      args: [],
    );
  }

  String get per_details {
    return Intl.message(
      'personal detials',
      name: 'per_details',
      desc: '',
      args: [],
    );
  }

  String get fname {
    return Intl.message(
      'first name',
      name: 'fname',
      desc: '',
      args: [],
    );
  }

  String get lname {
    return Intl.message(
      'last name',
      name: 'lname',
      desc: '',
      args: [],
    );
  }

  String get emailid {
    return Intl.message(
      'email id',
      name: 'emailid',
      desc: '',
      args: [],
    );
  }

  String get mob_no {
    return Intl.message(
      'mobile number',
      name: 'mob_no',
      desc: '',
      args: [],
    );
  }

  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  String get Education {
    return Intl.message(
      'Education',
      name: 'Education',
      desc: '',
      args: [],
    );
  }

  String get add_Education {
    return Intl.message(
      'add Education',
      name: 'add_Education',
      desc: '',
      args: [],
    );
  }

  String get Graduationstatus {
    return Intl.message(
      'Graduation status',
      name: 'Graduationstatus',
      desc: '',
      args: [],
    );
  }

  String get Pursuing {
    return Intl.message(
      'Pursuing',
      name: 'Pursuing',
      desc: '',
      args: [],
    );
  }

  String get completed {
    return Intl.message(
      'completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  String get College {
    return Intl.message(
      'College',
      name: 'College',
      desc: '',
      args: [],
    );
  }

  String get Degree {
    return Intl.message(
      'Degree',
      name: 'Degree',
      desc: '',
      args: [],
    );
  }

  String get stream {
    return Intl.message(
      'stream',
      name: 'stream',
      desc: '',
      args: [],
    );
  }

  String get training {
    return Intl.message(
      'training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  String get add_training {
    return Intl.message(
      'add training',
      name: 'add training',
      desc: '',
      args: [],
    );
  }

  String get add_jobs {
    return Intl.message(
      'add jobs',
      name: 'add_jobs',
      desc: '',
      args: [],
    );
  }

  String get internship {
    return Intl.message(
      'internship',
      name: 'internship',
      desc: '',
      args: [],
    );
  }

  String get freelancer {
    return Intl.message(
      'freelancer',
      name: 'freelancer',
      desc: '',
      args: [],
    );
  }

  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  String get organization {
    return Intl.message(
      'organization',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  String get WFH {
    return Intl.message(
      'is working from home',
      name: 'WFH',
      desc: '',
      args: [],
    );
  }

  String get start_date {
    return Intl.message(
      'start date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  String get end_date {
    return Intl.message(
      'end date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  String get is_currently {
    return Intl.message(
      'is currently working',
      name: 'is_currently',
      desc: '',
      args: [],
    );
  }

  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  String get Project {
    return Intl.message(
      'Project',
      name: 'Project',
      desc: '',
      args: [],
    );
  }

  String get add_project {
    return Intl.message(
      'add project',
      name: 'add_project',
      desc: '',
      args: [],
    );
  }

  String get title {
    return Intl.message(
      'title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  String get project_link {
    return Intl.message(
      'project link',
      name: 'project_link',
      desc: '',
      args: [],
    );
  }

  String get additional_detials {
    return Intl.message(
      'additional detials',
      name: 'additional_detials',
      desc: '',
      args: [],
    );
  }

  String get add_add_details {
    return Intl.message(
      'add additional detials',
      name: 'add_add_details',
      desc: '',
      args: [],
    );
  }

  String get view_more {
    return Intl.message(
      'view more',
      name: 'view_more',
      desc: '',
      args: [],
    );
  }

  //-----------------------------------------------------------------------------------------------------

  /// `{role, select, member{You are a member} admin{You are an admin} other{sign up}}`
  String selectValue(Object role) {
    return Intl.select(
      role,
      {
        'member': 'You are a member',
        'admin': 'You are an admin',
        'other': 'sign up',
      },
      name: 'selectValue',
      desc: '',
      args: [role],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
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
