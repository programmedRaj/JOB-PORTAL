import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sih/pages/Home/video/pages/index.dart';

import 'package:sih/provider/internship.dart';

class HireContainer extends StatefulWidget {
  // final String posname;
  // final String nopos;
  // final String closingdate;
  // final String interviewmode;
  // final String interviewloc;
  // final String stipend;
  final String status;
  final bool isDark;
  final String jobid;
  final String meetid;
  const HireContainer(
      {this.status,
      this.jobid,
      // this.posname,
      // this.nopos,
      // this.closingdate,
      // this.interviewloc,
      // this.interviewmode,
      // this.stipend,
      this.isDark,
      this.meetid});

  @override
  _HireContainerState createState() => _HireContainerState();
}

class _HireContainerState extends State<HireContainer> {
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDark;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final job = Provider.of<InternshipDetialsProvider>(context)
        .internships
        .firstWhere((element) => element.jobid == widget.jobid);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    height: height * 0.50,
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
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              job.posnames,
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
                              "Closing Date : ${job.closingdate}",
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
                                job.interviewloc == null
                                    ? Container()
                                    : Text(
                                        job.interviewloc,
                                        style: GoogleFonts.workSans(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .highlightColor,
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
                                    child: job.nopositions == null
                                        ? Container()
                                        : Text(job.nopositions),
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
                                    child: job.interviewmode == null
                                        ? Container()
                                        : Text(job.interviewmode),
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
                                    child: Text('${job.stipend}/year'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      child: Text(
                                    'Status:  ',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).highlightColor),
                                  )),
                                  Container(
                                      child: widget.status == null
                                          ? Text(
                                              'Submitted',
                                              style: TextStyle(
                                                  color: isDarkk
                                                      ? Colors.blue
                                                      : Colors.blueGrey,
                                                  fontSize: 18),
                                            )
                                          : Text(widget.status,
                                              style: TextStyle(
                                                  color: isDarkk
                                                      ? Colors.blue
                                                      : Colors.blueGrey,
                                                  fontSize: 18))),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: widget.status == 'underreview'
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.video_call,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      IndexPage(isDarkk)));
                                        })
                                    : GestureDetector(
                                        onTap: () {
                                          Tooltip(
                                              message:
                                                  'You need be selected for next round');
                                        },
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.video_call,
                                              size: 30,
                                              color:
                                                  Theme.of(context).errorColor,
                                            ),
                                            onPressed: () {}),
                                      ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                  "Unique Meet ID :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: widget.meetid == null
                                    ? Container()
                                    : Text(
                                        widget.meetid,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
              ])
        ]);
  }
}
