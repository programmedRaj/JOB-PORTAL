import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/provider/newcourse.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;

class ProductDetial extends StatefulWidget {
  final int courseid;
  final String coursename;
  final String courseimage;
  final String courselink;
  const ProductDetial({
    Key key,
    this.courseid,
    this.coursename,
    this.courseimage,
    this.courselink,
  }) : super(key: key);

  @override
  _ProductDetialState createState() => _ProductDetialState();
}

class _ProductDetialState extends State<ProductDetial> {
  int alreadyen;
  BaseUrl baseUrl = BaseUrl();

  Future enroll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var bodymsg = json.encode({"course_id": widget.courseid});

    var response = await retry(
      () => http
          .post(baseUrl.enrollcourse,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    // print(response.statusCode);
    var k = response.body;
    var n = json.decode(k);

    if (response.statusCode == 200) {
      setState(() {
        alreadyen = 1;
      });
    } else if (response.statusCode == 403) {
      setState(() {
        alreadyen = 0;
      });
    } else {
      setState(() {
        alreadyen = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final course = Provider.of<Courseexact>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/pngwave.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: width * 0.8,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.coursename,
                          maxLines: 4,
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      //-------------------------------------------------------------------------
      bottomNavigationBar: Container(
        height: height * 0.1,
        child: BottomAppBar(
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: height,
                  width: width,
                  child: FlatButton(
                      onPressed: () async {
                        enroll();
                        if (alreadyen == 1) {
                          course.addid(widget.courseid);
                          if (await canLaunch(widget.courselink)) {
                            await launch(widget.courselink);
                          } else {
                            throw 'Could not launch ';
                          }
                        } else if (alreadyen == 0) {
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                    content:
                                        new Text("You Have Already Applied"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Close me!'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Enroll',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.shopping_cart,
                              color: Theme.of(context).primaryColor)
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Future dailog(BuildContext context, String val, Widget data, String title) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(val.toString()),
            content: Container(
              child: Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) => data));
                      },
                      child: Text(title)),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close')),
                ],
              ),
            ),
          );
        });
  }
}
