import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Auth/phoneauth.dart';
import 'package:sih/pages/Home/course/course_screen.dart';
import 'package:sih/pages/Home/course/my_courses.dart';
import 'package:sih/pages/Home/jobs/apply_job.dart';
import 'package:sih/pages/Home/home.dart';
import 'package:sih/pages/Home/resume/edit_resume.dart';

Drawer draw(BuildContext context, double height, bool isDarkk) {
  final delegate = S.of(context);

  return Drawer(
    child: ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.6)),
            child: Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'fname',
                        style: GoogleFonts.lustria(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                )),
          ),
        ),
        ListTile(
          leading: Icon(Icons.work),
          title: Text(delegate.pageTitle),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Home()));
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text(delegate.edit_resume),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => Editresume(isDark: isDarkk)));
          },
        ),
        ListTile(
          leading: Icon(Icons.group_work),
          title: Text(delegate.applied_jobs),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AppliedJobs(isDarkk)));
          },
        ),
        ExpansionTile(
          leading: Icon(Icons.table_chart),
          title: Text(delegate.courses),
          children: [
            ListTile(
              leading: Icon(Icons.collections_bookmark),
              title: Text(delegate.all_co),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => AllCourse(isDarkk))); // ok wait
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text(delegate.my_co),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Mycourse(isDarkk)));
              },
            ),
          ],
        ),
        Container(
          height: height * 0.08,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
              borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
              onPressed: () {
                shared();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Phone()));
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        )
      ],
    ),
  );
}

Future shared() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}
