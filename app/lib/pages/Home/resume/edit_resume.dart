//https://stackoverflow.com/questions/60160972/how-to-correctly-fetch-apis-using-provider-in-flutter

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Auth/phoneauth.dart';
import 'package:sih/pages/Home/resume/section.dart/job_sec.dart';
import 'package:sih/pages/Home/resume/section.dart/projectsec.dart';

import 'package:sih/provider/userprovider.dart';

import 'section.dart/additionalsec.dart';
import 'section.dart/education_sec.dart';
import 'section.dart/trainingsec.dart';

class Editresume extends StatefulWidget {
  final bool isDark;
  Editresume(this.isDark);
  @override
  _EditresumeState createState() => _EditresumeState();
}

class _EditresumeState extends State<Editresume> {
  var h = 60.0;
  var w = 100.0;
  bool hua = false;

  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    bool isDarkk = widget.isDark;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Future.microtask(
        () => Provider.of<UserProvider>(context, listen: false).getdetials());
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      floatingActionButton: AnimatedContainer(
          margin: EdgeInsets.only(top: 30, left: 30),
          duration: Duration(milliseconds: 800),
          height: h,
          width: w * 1.3,
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
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: IconButton(
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
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                        Icons.person_pin,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Resume',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                )),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(delegate.edit_resume,
            style: GoogleFonts.workSans(
                textStyle: TextStyle(color: Theme.of(context).primaryColor))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //personal details
            Container(
              width: width,
              height: height * 0.25,
              color: isDarkk
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            delegate.per_details,
                            style: TextStyle(
                                color: Theme.of(context).highlightColor),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/personaldetial');
                            }),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          // fname == null ? Container() : Text(fname),
                          // lname == null ? Container() : Text(lname),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                          ' ${user.user.values.map((e) => e.useremail).toString().substring(1, (user.user.values.map((e) => e.useremail).toString().length) - 1)}'),
                    ),
                    Container(
                      child: Text(
                          ' ${user.user.values.map((e) => e.usernumber).toString().substring(1, (user.user.values.map((e) => e.usernumber).toString().length) - 1)}'),
                    ),
                    Container(
                        // child: location == null || location == ""
                        //     ? Text(
                        //         'Please enter your location',
                        //         style: TextStyle(
                        //             color: Theme.of(context).errorColor),
                        //       )
                        //     : Text(location),
                        )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            //Education
            Educationsec(user, isDarkk),
            SizedBox(
              height: height * 0.01,
            ),
            //JOBS
            JObsec(user, isDarkk),
            SizedBox(
              height: height * 0.01,
            ),

            //TRAININGS
            Trainingsec(user, isDarkk),
            SizedBox(
              height: height * 0.01,
            ),
            //PROJECTS
            Projectsec(user, isDarkk),
            SizedBox(
              height: height * 0.01,
            ),
            //SKILLS
            Container(
              width: width,
              height: user.skills.length * 100.0,
              color: isDarkk
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        delegate.skills,
                        style:
                            TextStyle(color: Theme.of(context).highlightColor),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2, //user.skills.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          // Container(
                                          //   child:
                                          //       Text(user.skills[index].skill),
                                          // ),
                                          // Container(
                                          //   child:
                                          //       Text(user.skills[index].level),
                                          // )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                size: 13,
                                              ),
                                              onPressed: () {},
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                size: 13,
                                              ),
                                              onPressed: () {},
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            }),
                      ),
                    ),
                    Container(
                      width: width / 2,
                      child: FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                delegate.skills,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Icon(Icons.add,
                                  color: Theme.of(context).accentColor)
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            //ADDITIONAL DETAILS
            Additionalsec(user, isDarkk),
            SizedBox(
              height: height * 0.01,
            ),
            // Container(
            //   height: height * 0.08,
            //   width: width,
            //   margin: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //       color: Theme.of(context).errorColor,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: FlatButton(
            //       onPressed: () {
            //         shared();
            //         Navigator.of(context)
            //             .push(MaterialPageRoute(builder: (ctx) => Phone()));
            //       },
            //       child: Text(
            //         "Log Out",
            //         style: TextStyle(color: Theme.of(context).primaryColor),
            //       )),
            // )
          ],
        ),
      ),
    );
  }

  // Future shared() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('token');
  // }
}
