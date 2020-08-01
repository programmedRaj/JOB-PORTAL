import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/models/resumemodel/details.dart';
import 'package:sih/api/models/resumemodel/educations.dart';
import 'package:sih/api/models/resumemodel/experience.dart';
import 'package:sih/api/models/resumemodel/projects.dart';
import 'package:sih/api/models/resumemodel/skills.dart';
import 'package:sih/api/models/resumemodel/training.dart';

import 'package:http/http.dart' as http;
import 'package:sih/api/models/user.dart';
import 'package:sih/api/service/baseurl.dart';

class UserProvider with ChangeNotifier {
  BaseUrl baseUrl = BaseUrl();

  Future getdetials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var bodymsg = json.encode({"want": "everything"});
    var response = await retry(
      () => http
          .post(baseUrl.displayresume,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    var k = response.body;
    var n = json.decode(k);

    removeedu();
    for (int i = 0; i < n["edu_details"].length; i++) {
      educations.add(Educations(
        college: n["edu_details"][i]['college'],
        degree: n["edu_details"][i]['degree'],
        enddate: n["edu_details"][i]['end_date'],
        startyear: n["edu_details"][i]['start_year'],
        status: n["edu_details"][i]['status'],
        stream: n["edu_details"][i]['stream'],
      ));
    }
    removeexp();
    for (int i = 0; i < n["job_details"].length; i++) {
      experiences.add(Experiences(
        description: n["job_details"][i]['description'],
        enddate: n["job_details"][i]['end_date'],
        location: n["job_details"][i]['job_location'],
        profile: n["job_details"][i]['job_title'],
        organization: n["job_details"][i]['organiztion'],
        startdate: n["job_details"][i]['start_date'],
        type: n["job_details"][i]['type'],
      ));
    }

    adduserresume(
        useremail: n['personal_details']["email"],
        usernumber: n['personal_details']["phone_no"],
        userlocation: n['personal_details']["location"],
        additional: n['personal_details']["additional_details"]);

    removepro();
    for (int i = 0; i < n['projects_list'].length; i++) {
      addproject(
        title: n['projects_list'][i]['title'],
        startdate: n['projects_list'][i]['start_month'],
        enddate: n['projects_list'][i]['end_month'],
        description: n['projects_list'][i]['description'],
        projectlink: n['projects_list'][i]['project_link'],
      );
    }

    removedetials();
    adddetials(
        blogurl: n['work_examples']['blog_url'],
        github: n['work_examples']['github'],
        portfolio: n['work_examples']['portfolio']);

    removeskills();
    for (int i = 0; i < n['skills_list'].length; i++) {
      // addskills(
      //   skill: sk,

      // );
    }

    removetraining();
    for (int i = 0; i < n['trainings_list'].length; i++) {
      n['trainings_list'].length == 0 || n['trainings_list'] == 'empty'
          ? removetraining()
          : addtraining(
              profile: n['trainings_list'][i]['program_name'],
              organization: n['trainings_list'][i]['organization_name'],
              startdate: n['trainings_list'][i]['start_date'],
              enddate: n['trainings_list'][i]['end_date'],
              location: n['trainings_list'][i]['location'],
              description: n['trainings_list'][i]['description'],
            );
    }
  }

  Map<String, User> user = {};

  Map<String, User> get users => user;

  List<Educations> educations = [];
  List<Experiences> experiences = [];
  List<Projects> projects = [];
  List<Trainings> training = [];
  List<Skillss> skills = [];
  List<Detialss> details = [];

  List<Educations> get ed => educations;
  List<Experiences> get exp => experiences;
  List<Projects> get pro => projects;
  List<Trainings> get tra => training;
  List<Skillss> get ski => skills;
  List<Detialss> get det => details;

  void adduseredu(
      {final String status,
      final String college,
      final String degree,
      final String stream,
      final String enddate,
      final String startyear}) {
    educations.add(Educations(
        startyear: startyear,
        enddate: enddate,
        status: status,
        college: college,
        degree: degree,
        stream: stream));
    notifyListeners();
  }

  void removeedu() {
    educations.clear();
    notifyListeners();
  }
  // ---------------------------------------------------------------------------

  void addexperience({
    final String type,
    final String profile,
    final String organization,
    final String location,
    final bool isworkfromhome,
    final String startdate,
    final String enddate,
    final bool iscurrentlyworking,
    final String description,
  }) {
    experiences.add(Experiences(
        type: type,
        profile: profile,
        organization: organization,
        location: location,
        isworkfromhome: isworkfromhome,
        startdate: startdate,
        enddate: enddate,
        iscurrentlyworking: iscurrentlyworking,
        description: description));
    notifyListeners();
  }

  void removeexp() {
    experiences.clear();
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  void addproject({
    final String title,
    final String startdate,
    final String enddate,
    final bool ongoing,
    final String description,
    final String projectlink,
  }) {
    projects.add(Projects(
      title: title,
      startdate: startdate,
      enddate: enddate,
      description: description,
      projectlink: projectlink,
    ));
    notifyListeners();
  }

  void removepro() {
    projects.clear();
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  void adddetials({
    final String blogurl,
    final String github,
    final String portfolio,
  }) {
    details.add(Detialss(
      blogurl: blogurl,
      github: github,
      portfolio: portfolio,
    ));
    notifyListeners();
  }

  void removedetials() {
    details.clear();
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  void addskills({
    final String skill,
    final String level,
  }) {
    skills.add(Skillss(
      skill: skill,
      level: level,
    ));
    notifyListeners();
  }

  void removeskills() {
    skills.clear();
    notifyListeners();
  }
  //---------------------------------------------------

  void addtraining({
    final String profile,
    final String organization,
    final String location,
    final bool online,
    final String startdate,
    final String enddate,
    final bool ongoing,
    final String description,
  }) {
    training.add(Trainings(
        description: description,
        profile: profile,
        location: location,
        startdate: startdate,
        enddate: enddate,
        organization: organization));
    notifyListeners();
  }

  void removetraining() {
    training.clear();
    notifyListeners();
  }

  //-----------------------------------------------------------------------------
  void adduserresume({
    final String useremail,
    final String usernumber,
    final String userlocation,
    final String additional,
  }) {
    var thekey = usernumber;
    if (user.isEmpty) {
      if (user.containsKey(thekey)) {
        user.remove(thekey);
      } else {
        user.putIfAbsent(
            thekey,
            () => User(
                  useremail: useremail,
                  userlocation: userlocation,
                  usernumber: usernumber,
                  additional: additional,
                  education: educations,
                  experience: experiences,
                  project: projects,
                  details: details,
                  skills: skills,
                ));
      }
    } else {
      user.update(
          thekey,
          (value) => User(
                useremail: useremail,
                userlocation: userlocation,
                usernumber: usernumber,
                additional: additional,
                education: educations,
                experience: experiences,
              ));
    }

    notifyListeners();
  }

  void remove() {
    user.clear();
    notifyListeners();
  }
}
