import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/widgets/shared/normaltext.dart';
import 'package:sih/widgets/shared/savebutton.dart';
import 'package:sih/widgets/shared/textfield.dart';

class Projectss extends StatefulWidget {
  final bool isDarkk;
  Projectss(this.isDarkk);
  @override
  _ProjectssState createState() => _ProjectssState();
}

class _ProjectssState extends State<Projectss> {
  bool isOn = false;
  String dob, tob, error;
  String placename;
  DateTime _dateTime;
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
          delegate.add_project,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              NormalTextField(delegate.title),
              SizedBox(
                height: height * 0.02,
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
                        isOn
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
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                  Text('Ongoing')
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Textfield(250, 6, delegate.description),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField(delegate.project_link),
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
