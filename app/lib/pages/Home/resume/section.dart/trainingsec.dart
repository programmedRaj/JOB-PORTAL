import 'package:flutter/material.dart';
import 'package:sih/api/models/user.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/resume/add/training.dart';
import 'package:sih/provider/userprovider.dart';

class Trainingsec extends StatefulWidget {
  final UserProvider user;
  final bool isDarkk;
  const Trainingsec(this.user, this.isDarkk);
  @override
  _TrainingsecState createState() => _TrainingsecState();
}

class _TrainingsecState extends State<Trainingsec> {
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = widget.user;
    final delegate = S.of(context);

    return Container(
      width: width,
      height: user.training.length == 0 || user.training.length == null
          ? user.training.length * 240.0 + 150
          : user.training.length * 240.0 + 50,
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
                delegate.training,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            Flexible(
              child: Container(
                child: user.training.length == 0 || user.training.length == null
                    ? Container(
                        child: Center(
                          child: Text('No Trainings ! Add Your Trainings'),
                        ),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: user.training.length,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                              user.training[index].profile),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(user
                                              .training[index].organization),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                              '(${user.training[index].startdate} -${user.training[index].enddate} )'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              user.training[index].description),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Training(isDarkk)));
                  },
                  child: Row(
                    children: [
                      Text(
                        delegate.add_training,
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
