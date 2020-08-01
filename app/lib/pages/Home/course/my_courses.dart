import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:sih/provider/newcourse.dart';

class Mycourse extends StatefulWidget {
  final bool isDarkk;
  Mycourse(
    this.isDarkk,
  );

  @override
  _MycourseState createState() => _MycourseState();
}

class _MycourseState extends State<Mycourse> {
  final BaseUrl baseUrl = BaseUrl();

  Future myenroll(Courseexact c) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var response = await retry(
      () => http.get(
        baseUrl.displayenrollcourse,
        headers: {"Content-Type": "application/json", "Authorization": token},
      ).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    // print(response.statusCode);
    var k = response.body;
    var n = json.decode(k);
    print(n);
    // c.removeenroll();
    // for (int i = 0; i < n['enrolled-courses'].length; i++) {
    //   c.addenrollcourse(courseid: n['enrolled-courses']['course_id']);
    // }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cp = Provider.of<Courseexact>(context, listen: false);
      myenroll(cp);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final delegate = S.of(context);
    final courselist = Provider.of<Courseexact>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          delegate.my_co,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: courselist.coursess.length,
            itemBuilder: (context, index) {
              return Container(
                  height: height * 0.2,
                  width: width,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                  decoration: BoxDecoration(
                      color: widget.isDarkk
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor.withOpacity(0.6),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).highlightColor,
                            blurRadius: 4)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width * 0.3,
                        color: Colors.blue,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Course Name:',
                                style: TextStyle(
                                    color: Theme.of(context).highlightColor),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // Container(
                            //   height: height * 0.05,
                            //   width: width * 0.45,
                            //   child: LiquidLinearProgressIndicator(
                            //     value: 0.5, // Defaults to 0.5.
                            //     valueColor: AlwaysStoppedAnimation(Theme.of(
                            //             context)
                            //         .accentColor), // Defaults to the current Theme's accentColor.
                            //     backgroundColor: Colors
                            //         .white, // Defaults to the current Theme's backgroundColor.
                            //     borderColor: Colors.blue,
                            //     borderWidth: 5.0,
                            //     borderRadius: 12.0,
                            //     direction: Axis
                            //         .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                            //     center: Text(
                            //       "50%",
                            //       style: TextStyle(
                            //           color: Theme.of(context).highlightColor,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.3),
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    delegate.view_more,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
