import 'package:flutter/material.dart';

import 'package:sih/api/models/user.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/resume/add/education.dart';
import 'package:sih/provider/userprovider.dart';

class Educationsec extends StatefulWidget {
  final UserProvider user;
  final bool isDarkk;
  const Educationsec(this.user, this.isDarkk);
  @override
  _EducationsecState createState() => _EducationsecState();
}

class _EducationsecState extends State<Educationsec> {
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final delegate = S.of(context);
    final user = widget.user;
    return Container(
      width: width,
      height: user.educations.length == 0 || user.educations.length == null
          ? user.educations.length * 240.0 + 150
          : user.educations.length * 240.0 + 50, // dynamic
      color: isDarkk
          ? Theme.of(context).primaryColor
          : Theme.of(context).disabledColor,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                delegate.Education,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            user.educations.length == 0 || user.educations.length == null
                ? Container(
                    child: Center(
                      child: Text('No Education ! Add Your Education'),
                    ),
                  )
                : Flexible(
                    child: Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: user.educations.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.all(10),
                                // decoration: BoxDecoration(
                                //     border: Border.all(
                                //         color: Theme.of(context).accentColor,
                                //         width: 5)),
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(15),
                                            child: Text(
                                                user.educations[index].degree),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(15),
                                            child: Text(
                                                user.educations[index].college),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                                user.educations[index].status),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                                user.educations[index].stream),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                      ),
                                                      onPressed: () {}),
                                                ),
                                                Container(
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                      ),
                                                      onPressed: () {}),
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: width * 0.28,
                                              height: height * 0.05,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        blurRadius: 1)
                                                  ],
                                                  color: Theme.of(context)
                                                      .accentColor),
                                              child: FlatButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    delegate.view_more,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }),
                    ),
                  ),
            Container(
              width: width / 2,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Education(isDarkk)));
                  },
                  child: Row(
                    children: [
                      Text(
                        delegate.add_Education,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      Icon(Icons.add, color: Theme.of(context).accentColor)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
