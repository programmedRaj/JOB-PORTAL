import 'course.dart';
import 'resumemodel/details.dart';
import 'resumemodel/educations.dart';
import 'resumemodel/experience.dart';
import 'resumemodel/projects.dart';
import 'resumemodel/skills.dart';
import 'resumemodel/training.dart';

class User {
  // final int userid;
  // final String userfname;
  // final String userlname;
  final String useremail;
  final String usernumber;
  final String userlocation;
  final String additional;
  final List<Educations> education;
  final List<Experiences> experience;
  final List<Projects> project;
  final List<Trainings> training;
  final List<Skillss> skills;
  final List<Detialss> details;
  final List<Course> mycourse;
  User(
      {
      //   this.userid,
      // this.userfname,
      // this.userlname,
      this.additional,
      this.useremail,
      this.usernumber,
      this.userlocation,
      this.education,
      this.project,
      this.experience,
      this.training,
      this.skills,
      this.details,
      this.mycourse});
}
