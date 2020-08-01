import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sih/api/models/course.dart';

class Courseexact with ChangeNotifier {
  List<Course> coursess = [];

  List<Course> get courses => coursess;
//-------------------------------------------------------------------------
  int courseid;
  int get courseids => courseid;

  void addid(int id) {
    courseid = id;
    notifyListeners();
  }

//-------------------------------------------------------------------------
  List<Course> enrollcourse = [];
  List<Course> get enco => enrollcourse;

  void addenrollcourse({String courseid}) {
    // enrollcourse.add(Course(courseid: ));
    notifyListeners();
  }

  void removeenroll() {
    enrollcourse.clear();
    notifyListeners();
  }

//-------------------------------------------------------------------------

  void addr(
      {String category,
      int courseid,
      String description,
      String level,
      String postedby,
      int price,
      String skills,
      String title,
      String link}) {
    coursess.add(Course(
        category: category,
        courseid: courseid,
        description: description,
        level: level,
        postedby: postedby,
        price: price,
        skills: skills,
        title: title,
        link: link));
    notifyListeners();
  }

  void remove() {
    coursess.clear();
    notifyListeners();
  }
}
