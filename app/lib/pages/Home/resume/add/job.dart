import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/widgets/shared/normaltext.dart';
import 'package:sih/widgets/shared/savebutton.dart';
import 'package:sih/widgets/shared/textfield.dart';

class Job extends StatefulWidget {
  final bool isDarkk;
  Job(this.isDarkk);
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  bool isWorkFromHome = false;
  bool isWorking = false;
  String dob, tob, error;
  String placename;
  DateTime _dateTime;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final delegate = S.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(
          delegate.add_jobs,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Radio(
                        activeColor: Theme.of(context).accentColor,
                        value: 1,
                        groupValue: group,
                        onChanged: (t) {
                          print(t);
                          setState(() {
                            group = t;
                          });
                        }),
                    Text(delegate.internship),
                    Radio(
                        value: 2,
                        groupValue: group,
                        onChanged: (t) {
                          print(t);
                          setState(() {
                            group = t;
                          });
                        }),
                    Text(delegate.jobs),
                    Radio(
                        activeColor: Theme.of(context).accentColor,
                        value: 3,
                        groupValue: group,
                        onChanged: (t) {
                          print(t);
                          setState(() {
                            group = t;
                          });
                        }),
                    Text(delegate.freelancer),
                  ],
                ),
              ),
              NormalTextField(delegate.profile),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField(delegate.organization),
              SizedBox(
                height: height * 0.02,
              ),
              isWorkFromHome
                  ? IgnorePointer(
                      child: Text(delegate.WFH),
                    )
                  : NormalTextField(delegate.location),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isWorkFromHome,
                    onChanged: (value) {
                      setState(() {
                        isWorkFromHome = value;
                      });
                    },
                  ),
                  Text(delegate.WFH)
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 10, top: 20),
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .highlightColor
                                        .withOpacity(0.4),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(_dateTime == null
                                      ? 'dd-mm-yyyy'
                                      : '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'))),
                          Container(
                            child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              child: Text(
                                delegate.start_date,
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _dateTime == null
                                            ? DateTime.now()
                                            : _dateTime,
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now())
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;
                                    dob =
                                        '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
                                    print(dob);
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      children: [
                        isWorking
                            ? IgnorePointer(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 10, top: 20),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .highlightColor
                                                    .withOpacity(0.4),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(_dateTime == null
                                                  ? 'dd-mm-yyyy'
                                                  : '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'))),
                                      Container(
                                        child: RaisedButton(
                                          color:
                                              Theme.of(context).highlightColor,
                                          child: Text(
                                            delegate.end_date,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        _dateTime == null
                                                            ? DateTime.now()
                                                            : _dateTime,
                                                    firstDate: DateTime(1950),
                                                    lastDate: DateTime.now())
                                                .then((date) {
                                              setState(() {
                                                _dateTime = date;
                                                dob =
                                                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
                                                print(dob);
                                              });
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .highlightColor
                                                  .withOpacity(0.4),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(_dateTime == null
                                                ? 'dd-mm-yyyy'
                                                : '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'))),
                                    Container(
                                      child: RaisedButton(
                                        color: Theme.of(context).accentColor,
                                        child: Text(
                                          delegate.end_date,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: _dateTime == null
                                                      ? DateTime.now()
                                                      : _dateTime,
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime.now())
                                              .then((date) {
                                            setState(() {
                                              _dateTime = date;
                                              dob =
                                                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
                                              print(dob);
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isWorking,
                    onChanged: (value) {
                      setState(() {
                        isWorking = value;
                      });
                    },
                  ),
                  Text(delegate.is_currently)
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Textfield(250, 6, delegate.description),
              SizedBox(
                height: height * 0.02,
              ),
              SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
