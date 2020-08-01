import 'package:flutter/material.dart';
import 'package:sih/widgets/shared/normaltext.dart';
import 'package:sih/widgets/shared/savebutton.dart';
import 'package:sih/widgets/shared/textfield.dart';

class Internships extends StatefulWidget {
  @override
  _InternshipsState createState() => _InternshipsState();
}

class _InternshipsState extends State<Internships> {
  bool isWorkFromHome = false;
  bool isWorking = false;
  String dob, tob, error;
  String placename;
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Add Internships',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              NormalTextField('Profile'),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('Organization'),
              SizedBox(
                height: height * 0.02,
              ),
              isWorkFromHome
                  ? IgnorePointer(
                      child: Text('You Are Working From Home'),
                    )
                  : NormalTextField('Location'),
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
                  Text('is Work From Home')
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
                                'Start Date',
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
                                            'End date',
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
                                          'End date',
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
                  Text('is Currently Working')
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Textfield(250, 6, 'Description'),
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
