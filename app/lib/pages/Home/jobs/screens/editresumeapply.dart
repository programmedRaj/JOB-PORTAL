import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/baseurl.dart';

class EditApply extends StatefulWidget {
  final String jobid;
  const EditApply({
    this.jobid,
  });
  @override
  _EditApplyState createState() => _EditApplyState();
}

class _EditApplyState extends State<EditApply> {
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
                  Navigator.pushNamed(context, '/similar');
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
