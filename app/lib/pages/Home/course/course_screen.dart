import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih/api/models/course.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/language/generated/l10n.dart';

import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:sih/pages/Home/course/course_single_product.dart';
import 'package:sih/provider/newcourse.dart';

class AllCourse extends StatefulWidget {
  final bool isDark;
  const AllCourse(
    this.isDark,
  );
  @override
  _AllCourseState createState() => _AllCourseState();
}

class _AllCourseState extends State<AllCourse> {
  bool sizz = false;
  String location = 'All';
  BaseUrl baseUrl = BaseUrl();

  // ignore: missing_return
  Future<CategoryCourse> categoryc({
    String category,
    Courseexact course,
  }) async {
    var bodymsg;

    if (category == 'All') {
      bodymsg = json.encode({
        "category": "",
      });
    } else {
      bodymsg = json.encode({
        "category": category,
      });
    }

    var response = await retry(
      () => http
          .post(baseUrl.allcourses,
              headers: {
                "Content-Type": "application/json",
                // "Authorization": token.token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    print(response.statusCode);
    var k = response.body;
    var n = json.decode(k);
    course.remove();
    for (int i = 0; i < n.length; i++) {
      course.addr(
          category: n[i]['category'],
          courseid: n[i]['course_id'],
          description: n[i]['description'],
          level: n[i]['level'],
          postedby: n[i]['posted_by'],
          price: n[i]['price'],
          skills: n[i]['skills_taught'],
          title: n[i]['title'],
          link: n[i]['url']);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final courses = Provider.of<Courseexact>(context, listen: false);
      categoryc(category: location, course: courses);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDark;
    final delegate = S.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final courses = Provider.of<Courseexact>(context);
    print(courses.coursess.length);

    if (width <= 320.0) {
      setState(() {
        sizz = true;
      });
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkk
              ? Theme.of(context).accentColor
              : Theme.of(context).hintColor.withOpacity(0.4),
          title: Text(
            delegate.all_co,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          iconTheme: Theme.of(context).iconTheme,
          actions: [
            Container(
              // width: siz ? width * 0.45 : width * 0.5,
              // height: siz ? height * 0.12 : height * 0.09,
              child: DropdownButton(
                items: [
                  "All",
                  "Development",
                  "Business",
                  "Finance & Accounting",
                  "IT & Software",
                  "Office Productivity",
                  "Personal Development",
                  "Design",
                  "Marketing",
                  "Lifestyle",
                  "Photography",
                  "Health & Fitness",
                  "Music",
                  "Teaching & Academics"
                ].map((e) {
                  return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                            // fontSize: siz ? 15 : 20,
                            color: isDarkk
                                ? Theme.of(context).hintColor
                                : Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ));
                }).toList(),
                onChanged: (loc) {
                  setState(() {
                    location = loc; // done
                  });
                  categoryc(category: location, course: courses);
                },
                value: location,
                isExpanded: false,
                hint: Text(
                  location,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: (width / height) * 1.35),
            itemCount: courses.coursess.length,
            itemBuilder: (c, index) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ProductDetial(
                                  courselink: courses.coursess[index].link,
                                  coursename: courses.coursess[index].title,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).highlightColor,
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: height * 0.2,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/pngwave.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            courses.coursess[index].title,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
