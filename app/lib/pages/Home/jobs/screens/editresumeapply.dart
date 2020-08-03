import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/pages/Home/resume/edit_resume.dart';
import 'package:sih/provider/question.dart';

class EditApply extends StatefulWidget {
  final String jobid;
  final bool isDark;
  const EditApply({this.jobid, this.isDark});
  @override
  _EditApplyState createState() => _EditApplyState();
}

class _EditApplyState extends State<EditApply> {
  bool isSubmitted = false;
  bool subbutton = false;
  int _currentPage = 0;
  int score = 0;
  int totalscore;
  String lab = '';
  final PageController _pageController = PageController(initialPage: 0);

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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //  var q =   Provider.of<Question>(context, listen: false).getqna(widget.jobid);
    // });
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final qna =
          Provider.of<Question>(context, listen: false).getqna(widget.jobid);
    });
    final qna = Provider.of<Question>(context);
    // print(qna.slides.length);

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
            height: height * 0.5,
            width: width,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  print(scrollInfo.metrics.pixels);
                }
              },
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: qna.slides.length,
                  itemBuilder: (context, i) {
                    return Container(
                      height: height * 0.4,
                      width: width * 0.8,
                      margin: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: widget.isDark
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.blueGrey, blurRadius: 5)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Text(qna.slide[i].question),
                          ),
                          isSubmitted
                              ? IgnorePointer(
                                  child: Container(
                                    child: RadioButtonGroup(
                                        onChange: (label, index) {
                                          setState(() {
                                            lab = label;
                                          });
                                        },
                                        labels: [
                                          qna.slide[i].a1,
                                          qna.slide[i].a2,
                                          qna.slide[i].a3,
                                          qna.slide[i].a4,
                                        ]),
                                  ),
                                )
                              : Container(
                                  // call utha fast done
                                  child: RadioButtonGroup(
                                      activeColor:
                                          Theme.of(context).accentColor,
                                      onChange: (label, index) {
                                        print(qna.slide[i].valid);
                                        if (qna.slide[i].valid == label) {
                                          setState(() {
                                            score = score + 10;
                                          });
                                        }
                                        setState(() {
                                          lab = label;
                                        });
                                      },
                                      labels: [
                                        qna.slide[i].a1,
                                        qna.slide[i].a2,
                                        qna.slide[i].a3,
                                        qna.slide[i].a4,
                                      ]),
                                ),

                          // Container(
                          //   child: score == 0 || score == null
                          //       ? Text(
                          //           '0',
                          //           style: TextStyle(
                          //               color: Theme.of(context).primaryColor),
                          //         )
                          //       : Text(
                          //           score.toString(),
                          //           style: TextStyle(
                          //               color: Theme.of(context).primaryColor),
                          //         ),
                          // )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Container(
            height: height * 0.04,
            width: width * 0.2,
            margin: EdgeInsets.only(left: width * 0.45),
            decoration: BoxDecoration(
                color: isSubmitted
                    ? Theme.of(context).errorColor
                    : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5)),
            child: FlatButton(
                onPressed: () {
                  totalscore = qna.slides.length * 10;
                  setState(() {
                    isSubmitted = true;
                  });
                  if (score >= totalscore / 2) {
                    setState(() {
                      subbutton = true;
                    });
                  } else if (score < totalscore / 2) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              content: new Text(
                                  "Sorry You Are Not Eligible for This Job"),
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
                child: Text('data')),
          ),
          Container(
              height: height * 0.1,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < qna.slides.length; i++)
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          radius: 5,
                        ),
                      )
                  ],
                ),
              )),
          //---------------------------------------------------------------------------------------------------------------------
          subbutton
              ? Container(
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
                        }
                      },
                      child: Text(
                        'Proceed To Application',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 19),
                      )),
                )
              : IgnorePointer(
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                        onPressed: () async {},
                        child: Text(
                          'Proceed To Application',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 19),
                        )),
                  ),
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
