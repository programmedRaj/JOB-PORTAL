import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/models/question.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/pages/Home/resume/edit_resume.dart';

import 'slideitems/slidedot.dart';
import 'slideitems/slideitem.dart';

class EditApply extends StatefulWidget {
  final String jobid;
  final bool isDark;
  const EditApply({this.jobid, this.isDark});
  @override
  _EditApplyState createState() => _EditApplyState();
}

class _EditApplyState extends State<EditApply> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Slide> slideList = [
    Slide(question: 'hi', a1: 'heyy', a2: 'oh', a3: 'f', a4: 'in')
  ];
  //------------------------------------
  final keyhire = GlobalKey<FormState>();
  BaseUrl baseUrl = BaseUrl();
  int isapplied;
  String answer;
  Future applied(String jobid, String answer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var bodymsg = json.encode({
      "job_id": jobid,
      "answer": answer,
    });

    var response = await retry(
      () => http
          .post(baseUrl.applyjobs,
              headers: {
                "Content-Type": "application/json",
                "Authorization": token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        isapplied = 0;
      });
    } else if (response.statusCode == 403) {
      setState(() {
        isapplied = 1;
      });
    } else {
      setState(() {
        isapplied = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration(seconds: 40), (Timer timer) {
    //   if (_currentPage < 4) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }

    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 300),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: Form(
                key: keyhire,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).accentColor.withOpacity(0.2),
                      filled: true,
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).accentColor)),
                      hintText: 'Why Should we Hire you?',
                      hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      )),
                  style: TextStyle(color: Theme.of(context).accentColor),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter your answer';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      answer = val;
                    });
                  },
                ),
              )),

          //----------------------------------------slider------------------------------------------------------------------------
          Container(
            margin: EdgeInsets.all(15),
            height: height * 0.65,
            width: width,
            decoration: BoxDecoration(
                color: widget.isDark
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.blueGrey, blurRadius: 5)]),
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: 4,
                  itemBuilder: (ctx, i) => SlideItem(i, height, width),
                ),
                Positioned(
                  top: height * 0.6,
                  left: 20,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 35),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < 4; i++)
                              if (i == _currentPage)
                                SlideDots(true, widget.isDark)
                              else
                                SlideDots(false, widget.isDark)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          //---------------------------------------------------------------------------------------------------------------------
          Container(
            width: width,
            height: height * 0.08,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
                onPressed: () async {
                  if (keyhire.currentState.validate()) {
                    applied(widget.jobid, answer);
                    if (isapplied == 0) {
                      await Navigator.pushNamed(context, '/similar');
                    } else if (isapplied == 1) {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                content: new Text("You Have Already Applied"),
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
                  }
                },
                child: Text(
                  'Proceed To Application',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 19),
                )),
          ),
          Container(
            width: width,
            height: height * 0.08,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => Editresume()));
                },
                child: Text(
                  'Edit Your Resume',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 19),
                )),
          ),
        ],
      )),
    )));
  }
}
