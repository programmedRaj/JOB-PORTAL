// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(counter) =>
      "${Intl.plural(counter, zero: 'You have never pushed this button.', one: 'You have pushed this button 1 time.', other: 'You have pushed this button ${counter} times.')}";

  static m1(gender) =>
      "${Intl.gender(gender, female: 'Her', male: 'Him', other: 'Them')}";

  static m2(role) => "${Intl.select(role, {
        'member': 'You are a member',
        'admin': 'You are an admin',
        'other': 'sign up',
      })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "pageTitle": MessageLookupByLibrary.simpleMessage("Jobs"),
        "Number_input": MessageLookupByLibrary.simpleMessage("Number"),
        "num_placeholder":
            MessageLookupByLibrary.simpleMessage("Enter Your Mobile number"),
        "num_validation": MessageLookupByLibrary.simpleMessage(
            "Mobile number should be atleast 10 digits"),

        "num_validation_2": MessageLookupByLibrary.simpleMessage(
            "Mobile number can\'t be more than 10 digits"),
        "login_with_otp": MessageLookupByLibrary.simpleMessage(
            "Login with OTP if you want to Login with Password turn switch off"),
        "Password_input": MessageLookupByLibrary.simpleMessage("Password"),
        "password_placeholder":
            MessageLookupByLibrary.simpleMessage("Enter Your Password"),
        "passw_validation": MessageLookupByLibrary.simpleMessage(
            "Password should be atleast 6 digits"),
        "can_login_with_otp": MessageLookupByLibrary.simpleMessage(
            "If You Forget Password you can login with otp"),
        "f_passw": MessageLookupByLibrary.simpleMessage("Forget Password?"),
        "verify": MessageLookupByLibrary.simpleMessage("verify"),
        "resend": MessageLookupByLibrary.simpleMessage("resend"),
        "gen_otp": MessageLookupByLibrary.simpleMessage("generate otp"),
        "Login": MessageLookupByLibrary.simpleMessage("Login"),
        "Register": MessageLookupByLibrary.simpleMessage("Register"),
        "new_here": MessageLookupByLibrary.simpleMessage("New Here ?"),
        "otp_onthe_way": MessageLookupByLibrary.simpleMessage(
            "Auto retrieving verification code"),
        "something_wrong": MessageLookupByLibrary.simpleMessage(
            "Something has gone wrong, please try later"),
        "Check_net": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection and try again"),
        "timeout": MessageLookupByLibrary.simpleMessage("timeout"),
        "code_sent_to": MessageLookupByLibrary.simpleMessage("code sent to"),
        "u_r_verified":
            MessageLookupByLibrary.simpleMessage("You Are Verified"),
        "edit_resume": MessageLookupByLibrary.simpleMessage("Edit Resume"),
        "applied_jobs": MessageLookupByLibrary.simpleMessage("Applied Jobs"),
        "courses": MessageLookupByLibrary.simpleMessage("Courses"),
        "all_co": MessageLookupByLibrary.simpleMessage("All courses"),
        "my_co": MessageLookupByLibrary.simpleMessage("My courses"),
        //sayad extra hai deleted field.
        "know_more": MessageLookupByLibrary.simpleMessage("know more"),

        //job details
        "apply_now": MessageLookupByLibrary.simpleMessage("apply now"),
        "perks": MessageLookupByLibrary.simpleMessage("perks"),
        "about_us": MessageLookupByLibrary.simpleMessage("About Us"),
        "day_2_day": MessageLookupByLibrary.simpleMessage("day to day task"),
        "skills": MessageLookupByLibrary.simpleMessage("skills"),

        "proceed_app":
            MessageLookupByLibrary.simpleMessage("proceed to application"),
        "edit_ur_resume":
            MessageLookupByLibrary.simpleMessage("edit your resume"),
        "successfully_applied": MessageLookupByLibrary.simpleMessage(
            "You have successfully applied for this job"),
        "per_details": MessageLookupByLibrary.simpleMessage("personal detials"),
        "fname": MessageLookupByLibrary.simpleMessage("first name"),
        "lname": MessageLookupByLibrary.simpleMessage("last name"),
        "emailid": MessageLookupByLibrary.simpleMessage("email id"),
        "mob_no": MessageLookupByLibrary.simpleMessage("mobile number"),
        "location": MessageLookupByLibrary.simpleMessage("location"),
        "save": MessageLookupByLibrary.simpleMessage(
            "save"), // use 4 all save buttons.

        "Education": MessageLookupByLibrary.simpleMessage("Education"),
        "add_Education": MessageLookupByLibrary.simpleMessage("add Education"),
        "Graduationstatus":
            MessageLookupByLibrary.simpleMessage("Graduation status"),
        "Pursuing": MessageLookupByLibrary.simpleMessage("Pursuing"),
        "completed": MessageLookupByLibrary.simpleMessage("completed"),
        "College": MessageLookupByLibrary.simpleMessage("College"),
        "Degree": MessageLookupByLibrary.simpleMessage("Degree"),
        "stream": MessageLookupByLibrary.simpleMessage("stream"),
        "training": MessageLookupByLibrary.simpleMessage("training"),
        "add training": MessageLookupByLibrary.simpleMessage("add training"),
        "jobs": MessageLookupByLibrary.simpleMessage("Jobs"),
        "add_jobs": MessageLookupByLibrary.simpleMessage("add jobs"),
        "internship": MessageLookupByLibrary.simpleMessage("Internship"),
        "freelancer": MessageLookupByLibrary.simpleMessage("freelancer"),
        "profile": MessageLookupByLibrary.simpleMessage("profile"),
        "organization": MessageLookupByLibrary.simpleMessage("organization"),
        "WFH": MessageLookupByLibrary.simpleMessage("is working from home"),
        "start_date": MessageLookupByLibrary.simpleMessage("start date"),
        "end_date": MessageLookupByLibrary.simpleMessage("end date"),
        "is_currently":
            MessageLookupByLibrary.simpleMessage("is currently working"),
        "description": MessageLookupByLibrary.simpleMessage("description"),
        "Project": MessageLookupByLibrary.simpleMessage("Project"),

        "add_project": MessageLookupByLibrary.simpleMessage("add project"),
        "title": MessageLookupByLibrary.simpleMessage("title"),
        "project_link": MessageLookupByLibrary.simpleMessage("project link"),
        "additional_detials":
            MessageLookupByLibrary.simpleMessage("additional detials"),
        "add_add_details":
            MessageLookupByLibrary.simpleMessage("add additional detials"),
        "view_more": MessageLookupByLibrary.simpleMessage("view more"),
      };
}
