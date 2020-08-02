import 'package:flutter/cupertino.dart';
import 'package:sih/api/models/appliedjobs.dart';
import 'package:sih/api/models/internshipdetials.dart';

class AppliedJobProvider with ChangeNotifier {
  List<AJ> jobs = [];
  List<AJ> get job => jobs;

  void addj({String jobid, String appliedon, String status, String meetid}) {
    print(meetid);
    jobs.add(
        AJ(appliedon: appliedon, jobid: jobid, status: status, meetid: meetid));
    notifyListeners();
  }

  void remove() {
    jobs.clear();
    notifyListeners();
  }
}
//---------------------------------------------------------

class AppliedJOblist with ChangeNotifier {
  List<InternshipDetails> appliedjobpro = [];

  List<InternshipDetails> get appliedjoblistpro => appliedjobpro;

  void addappj({
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
  }) {
    appliedjobpro.add(InternshipDetails(
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
}
