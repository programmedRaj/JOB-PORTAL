import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/jobs/screens/editresumeapply.dart';

class JobDetials extends StatefulWidget {
  final String posname;
  final String nopos;
  final String closingdate;
  final String datetime;
  final String jobdes;
  final String extrainfo;
  final String interviewmode;
  final String interviewloc;
  final String stipend;
  final String jobid;
  final String qualifications;
  final String postedon;
  final int isonlinetest;
  final bool isDark;
  const JobDetials(
    this.posname,
    this.nopos,
    this.closingdate,
    this.datetime,
    this.jobdes,
    this.extrainfo,
    this.interviewloc,
    this.interviewmode,
    this.isonlinetest,
    this.jobid,
    this.postedon,
    this.qualifications,
    this.stipend,
    this.isDark,
  );

  @override
  _JobDetialsState createState() => _JobDetialsState();
}

class _JobDetialsState extends State<JobDetials> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    bool isDarkk = widget.isDark;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor,
        title: Text(
          widget.posname,
          style: GoogleFonts.workSans(
              textStyle: TextStyle(color: Theme.of(context).primaryColor)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => EditApply(
                      jobid: widget.jobid,
                    )));
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //column1
            Container(
              height: height * 0.35,
              color: isDarkk
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.posname,
                        style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      child: Text(
                        widget.closingdate,
                        style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).highlightColor,
                                fontSize: 14)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).highlightColor,
                          ),
                          Text(
                            widget.interviewloc,
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Start: ${widget.datetime}',
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesome.globe,
                                color: Theme.of(context).highlightColor,
                              ),
                              Text(
                                widget.interviewmode,
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                        color: Theme.of(context).highlightColor,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Theme.of(context).highlightColor,
                              ),
                              Text(
                                widget.stipend,
                                style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                        color: Theme.of(context).highlightColor,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //column2
            Container(
              margin: EdgeInsets.only(top: 10),
              height: height * 1.5,
              width: width,
              color: isDarkk
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      delegate.about_us,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      widget.jobdes,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      delegate.day_2_day,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      widget.extrainfo,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10, bottom: 5),
                    child: Text(
                      delegate.skills,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: height * 0.1,
                    width: width,
                    child: Text(widget.qualifications),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "No. of positions",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    height: height * 0.1,
                    width: width,
                    child: Text(widget.nopos),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  //   height: height * 0.08,
                  //   width: width,
                  //   decoration: BoxDecoration(
                  //       color: Theme.of(context).accentColor,
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: FlatButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (ctx) => EditApply(
                  //                   jobid: widget.jobid,
                  //                 )));
                  //       },
                  //       child: Text(
                  //         delegate.apply_now,
                  //         style:
                  //             TextStyle(color: Theme.of(context).primaryColor),
                  //       )),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
