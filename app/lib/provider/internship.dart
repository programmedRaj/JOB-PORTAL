import 'package:flutter/cupertino.dart';
import 'package:sih/api/models/internshipdetials.dart';

class InternshipDetialsProvider with ChangeNotifier {
  List<InternshipDetails> internships = [];

  List<InternshipDetails> get internship => internships;

  int get itemCount {
    return internships.length;
  }

  void add({
    final String jobid,
    final String postedon,
    final String description,
    final String closingdate,
    final String nopositions,
    final String stipend,
    final String qualifications,
    final String extrainfo,
    final String interviewmode,
    final String interviewloc,
    final String datetimeinterview,
    final int isonlinetest,
    final String posnames,
    final String umeet,
  }) {
    internship.add(InternshipDetails(
        umeet: umeet,
        jobid: jobid,
        postedon: postedon,
        description: description,
        closingdate: closingdate,
        nopositions: nopositions,
        stipend: stipend,
        qualifications: qualifications,
        extrainfo: extrainfo,
        interviewmode: interviewmode,
        interviewloc: interviewloc,
        datetimeinterview: datetimeinterview,
        posnames: posnames,
        isonlinetest: isonlinetest));
    notifyListeners();
  }

  void remove() {
    internship.clear();
    notifyListeners();
  }
}
