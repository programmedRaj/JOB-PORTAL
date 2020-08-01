import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/widgets/shared/normaltext.dart';
import 'package:sih/widgets/shared/savebutton.dart';

class Education extends StatefulWidget {
  final bool isDark;
  Education(this.isDark);
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  int group = 1;
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDark;
    var height = MediaQuery.of(context).size.height;
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(
          delegate.add_Education,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      delegate.Graduationstatus,
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),

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
                      Text(delegate.Pursuing),
                      Radio(
                          value: 2,
                          groupValue: group,
                          onChanged: (t) {
                            print(t);
                            setState(() {
                              group = t;
                            });
                          }),
                      Text(delegate.completed)
                    ],
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                NormalTextField(delegate.College),
                SizedBox(
                  height: height * 0.02,
                ),
                //year
                Container(
                  child: Row(
                    children: [],
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                NormalTextField(delegate.Degree),
                SizedBox(
                  height: height * 0.02,
                ),
                NormalTextField(delegate.stream),
                SizedBox(
                  height: height * 0.02,
                ),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
