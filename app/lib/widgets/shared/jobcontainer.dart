import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/jobs/job_details.dart';

class JobContainer extends StatefulWidget {
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
  final bool size;
  JobContainer(
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
      this.size);

  @override
  _JobContainerState createState() => _JobContainerState();
}

class _JobContainerState extends State<JobContainer> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
              height: widget.size ? height * 0.4 : height * 0.43,
              width: width,
              decoration: BoxDecoration(
                  color: widget.isDark
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.blueGrey, blurRadius: 5)
                  ]),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.posname,
                        maxLines: 2,
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
                        "Closing Date : ${widget.closingdate}",
                        style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).highlightColor,
                                fontSize: 14)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).highlightColor,
                          ),
                          widget.interviewloc == null
                              ? Container()
                              : Text(
                                  widget.interviewloc,
                                  style: GoogleFonts.workSans(
                                      textStyle: TextStyle(
                                          color:
                                              Theme.of(context).highlightColor,
                                          fontSize: 14)),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    //daterow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_add,
                                  color: Theme.of(context).highlightColor,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(2),
                              child: widget.nopos == null
                                  ? Container()
                                  : Text(widget.nopos),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesome.globe,
                                  color: Theme.of(context).highlightColor,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(2),
                              child: widget.interviewmode == null
                                  ? Container()
                                  : Text(widget.interviewmode),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesome.inr,
                                  color: Theme.of(context).highlightColor,
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Text('${widget.stipend}/year'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => JobDetials(
                                    widget.posname,
                                    widget.nopos,
                                    widget.closingdate,
                                    widget.datetime,
                                    widget.jobdes,
                                    widget.extrainfo,
                                    widget.interviewloc,
                                    widget.interviewmode,
                                    widget.isonlinetest,
                                    widget.jobid,
                                    widget.postedon,
                                    widget.qualifications,
                                    widget.stipend,
                                    widget.isDark)));
                          },
                          child: Text(
                            delegate.know_more,
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600)),
                          )),
                    )
                  ],
                ),
              ))
        ]);
  }
}
