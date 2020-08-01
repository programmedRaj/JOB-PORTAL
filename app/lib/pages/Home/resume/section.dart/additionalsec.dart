import 'package:flutter/material.dart';
import 'package:sih/api/models/user.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/resume/add/additional_detail.dart';
import 'package:sih/provider/userprovider.dart';

class Additionalsec extends StatefulWidget {
  final UserProvider user;
  final bool isDarkk;
  const Additionalsec(this.user, this.isDarkk);
  @override
  _AdditionalsecState createState() => _AdditionalsecState();
}

class _AdditionalsecState extends State<Additionalsec> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = widget.user;
    return Container(
      width: width,
      height: user.details.length * 240.0,
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
                delegate.additional_detials,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            Flexible(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Text(
                                'BlogUrl:',
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                ' ${user.details.map((e) => e.blogurl).toString().substring(1, (user.details.map((e) => e.blogurl).toString().length) - 1)}',
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Text(
                                'Github: ',
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                ' ${user.details.map((e) => e.github).toString().substring(1, (user.details.map((e) => e.github).toString().length) - 1)}',
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Text(
                                'Portfolio: ',
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                ' ${user.details.map((e) => e.portfolio).toString().substring(1, (user.details.map((e) => e.portfolio).toString().length) - 1)}',
                                maxLines: 2,
                              ),
                            ),
                          ],
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
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {}),
                              ),
                              Container(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Theme.of(context).accentColor,
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
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor,
                                      blurRadius: 1)
                                ],
                                color: Theme.of(context).accentColor),
                            child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  delegate.view_more,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   width: width / 2,
            //   child: FlatButton(
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (ctx) => Additional(isDarkk)));
            //       },
            //       child: Row(
            //         children: [
            //           Text(
            //             delegate.add_add_details,
            //             style: TextStyle(color: Theme.of(context).accentColor),
            //           ),
            //           Icon(Icons.add, color: Theme.of(context).accentColor)
            //         ],
            //       )),
            // )
          ],
        ),
      ),
    );
  }
}
