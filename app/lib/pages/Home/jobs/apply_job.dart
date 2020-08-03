import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/models/internshipdetials.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/video/pages/index.dart';
import 'package:sih/provider/appliedjobprovider.dart';
import 'package:sih/widgets/shared/hirecontainer.dart';
import 'package:http/http.dart' as http;

class AppliedJobs extends StatefulWidget {
  final bool isDark;
  AppliedJobs(this.isDark);
  @override
  _AppliedJobsState createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  BaseUrl baseUrl = BaseUrl();

  Future appliedjobs(AppliedJobProvider appliedJobs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var response = await retry(
      () => http.get(
        baseUrl.appliedjobs,
        headers: {"Content-Type": "application/json", "Authorization": token},
      ).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      var k = response.body;
      var n = json.decode(k);
      print(n);
      appliedJobs.remove();
      for (int i = 0; i < n['appliedjobs'].length; i++) {
        appliedJobs.addj(
            jobid: n['appliedjobs'][i]['job_id'],
            appliedon: n['appliedjobs'][i]['applied_on'],
            status: n['appliedjobs'][i]['status'],
            meetid: n['appliedjobs'][i]['meetid']);
      }
    }
  }

  Future applyprovider(InternshipDetails jobs, AppliedJOblist app) async {
    app.addappj(
        jobid: jobs.jobid,
        closingdate: jobs.closingdate,
        datetimeinterview: jobs.datetimeinterview,
        description: jobs.description,
        extrainfo: jobs.extrainfo,
        interviewloc: jobs.interviewloc,
        interviewmode: jobs.interviewmode,
        nopositions: jobs.nopositions,
        isonlinetest: jobs.isonlinetest,
        posnames: jobs.posnames,
        postedon: jobs.postedon,
        qualifications: jobs.qualifications,
        stipend: jobs.stipend);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final appliedspro =
          Provider.of<AppliedJobProvider>(context, listen: false);

      appliedjobs(appliedspro);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDark;
    final delegate = S.of(context);
    // var height = MediaQuery.of(context).size.height;

    final appliedspro = Provider.of<AppliedJobProvider>(context);
    print(appliedspro.jobs.length);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkk
              ? Theme.of(context).accentColor
              : Theme.of(context).hintColor.withOpacity(0.4),
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            delegate.applied_jobs,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: Theme.of(context).accentColor,
        //     child: Icon(
        //       Icons.video_call,
        //       color: Theme.of(context).primaryColor,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //           MaterialPageRoute(builder: (ctx) => IndexPage(isDarkk)));
        //     }),
        // drawer: draw(context, height),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: appliedspro.jobs.length == 0
              ? Container(
                  child: Center(
                    child: Text("No Jobs applied"),
                  ),
                )
              : ListView.builder(
                  itemCount: appliedspro.jobs.length,
                  itemBuilder: (context, index) {
                    return HireContainer(
                      jobid: appliedspro.jobs[index].jobid,
                      isDark: isDarkk,
                      status: appliedspro.jobs[index].status,
                      meetid: appliedspro.jobs[index].meetid,
                    );
                  }),
        )));
  }
}