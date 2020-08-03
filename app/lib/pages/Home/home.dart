import 'package:dynamic_color_theme/dynamic_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/provider/internship.dart';
import 'package:sih/widgets/shared/draw.dart';
import 'package:sih/widgets/shared/jobcontainer.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/pages/Home/resume/add/internship.dart';

import 'package:overlay_support/overlay_support.dart';
import '../../provider/appliedjobprovider.dart';
import 'messagenotfication.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final int userid;
  Home({this.userid});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var h = 60.0;
  var w = 100.0;
  bool hua = false;
  bool language = false;
  bool isDarkk = false;
  bool size = false;
  bool listen = false;
  BaseUrl baseUrl = BaseUrl();
  String fname;

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  // ignore: missing_return
  Future<Internships> getjobs(String title, String start, String end,
      String location, InternshipDetialsProvider job) async {
    var bodymsg =
        json.encode({"title": "", "location": "", "start": "", "end": ""});

    var response = await retry(
      () => http
          .post(baseUrl.fetchjobs,
              headers: {
                "Content-Type": "application/json",
                // "Authorization": token.token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    // print(response.statusCode);
    var k = response.body;
    var n = json.decode(k);
    job.remove();
    for (int i = 0; i < n.length; i++) {
      job.add(
        jobid: n[i]['job_id'],
        closingdate: n[i]['closing_date'],
        datetimeinterview: n[i]['date_time_interview'],
        description: n[i]['description'],
        extrainfo: n[i]['extra_info'],
        interviewloc: n[i]['interveiw_loc'],
        stipend: n[i]['stipend'],
        interviewmode: n[i]['interview_mode'],
        nopositions: n[i]['no_postions'],
        postedon: n[i]['posted_on'],
        qualifications: n[i]['qualification'],
        posnames: n[i]['pos_names'],
        isonlinetest: n[i]['is_online_test'],
        umeet: n[i]['meetid'],
      );
    }
  }

  // ignore: missing_return

  @override
  Widget build(BuildContext context) {
    bool isDark = DynamicColorTheme.of(context).isDark;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final job =
          Provider.of<InternshipDetialsProvider>(context, listen: false);
      getjobs("", "", "", "", job);
    });
    final job = Provider.of<InternshipDetialsProvider>(context);

    // print(job.internships.length);
    final ap = Provider.of<AppliedJobProvider>(context);

    for (int i = 0; i < ap.jobs.length; i++) {
      if (ap.jobs[i].status == 'selected') {
        showOverlayNotification((context) {
          return MessageNotification(
            isDark: isDark,
            message: messages[3],
            onReply: () {
              OverlaySupportEntry.of(context).dismiss();
              toast('you checked this message');
            },
          );
        }, duration: Duration(milliseconds: 4000));
      }
    }

    final delegate = S.of(context);
    if (width <= 330) {
      setState(() {
        size = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(
          delegate.pageTitle,
          style: GoogleFonts.workSans(
            textStyle:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                showOverlayNotification((context) {
                  return MessageNotification(
                    isDark: isDarkk,
                    message: messages[3],
                    onReply: () {
                      OverlaySupportEntry.of(context).dismiss();
                      toast('you checked this message');
                    },
                  );
                }, duration: Duration(milliseconds: 4000));
                // showSimpleNotification(
                //     Text("this is a message from simple notification"),
                //     background: Colors.green);
              }),
          IconButton(
              icon: Icon(isDark ? Icons.wb_sunny : Icons.brightness_2),
              onPressed: () {
                DynamicColorTheme.of(context).setIsDark(
                  isDark: !isDark,
                  shouldSave: true,
                );
                setState(() {
                  isDarkk = isDark;
                  print(isDarkk);
                });
              }),
          Container(
            width: width * 0.15,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    language = !language;
                  });

                  language
                      ? setState(() {
                          S.load(Locale("fr", "FR"));
                        })
                      : setState(() {
                          S.load(Locale("en", "US"));
                        });
                },
                child: SvgPicture.asset(
                  'lib/assets/trans.svg',
                  color: Theme.of(context).primaryColor,
                )),
          )
          // _simplePopup(),
        ],
      ),
      drawer: draw(context, height, isDarkk),
      floatingActionButton: AnimatedContainer(
          margin: EdgeInsets.only(
            top: 30,
            left: 30,
          ),
          duration: Duration(milliseconds: 800),
          height: h,
          width: w,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(30)),
          child: hua
              ? Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).highlightColor,
                            blurRadius: 4)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            setState(() {
                              h = 60;
                              w = 100;
                              hua = false;
                            });
                          })
                    ],
                  ),
                )
              : FlatButton(
                  onPressed: () {
                    setState(() {
                      h = height * 0.9;
                      w = width;
                      hua = true;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                )),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.1),
            height: height * 0.9,
            width: width,
            child: ListView.builder(
                itemCount: job.internships.length,
                itemBuilder: (context, index) {
                  return JobContainer(
                      job.internship[index].posnames,
                      job.internship[index].nopositions,
                      job.internship[index].closingdate,
                      job.internship[index].datetimeinterview,
                      job.internship[index].description,
                      job.internship[index].extrainfo,
                      job.internship[index].interviewloc,
                      job.internship[index].interviewmode,
                      job.internship[index].isonlinetest,
                      job.internship[index].jobid,
                      job.internship[index].postedon,
                      job.internship[index].qualifications,
                      job.internship[index].stipend,
                      isDarkk,
                      size);
                }),
          ),
        ],
      )),
    );
  }
}
