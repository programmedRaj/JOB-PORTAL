import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/resume/add/job.dart';
import 'package:sih/provider/userprovider.dart';

class JObsec extends StatefulWidget {
  final UserProvider user;
  final bool isDarkk;
  const JObsec(this.user, this.isDarkk);
  @override
  _JObsecState createState() => _JObsecState();
}

class _JObsecState extends State<JObsec> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = widget.user;
    return Container(
      width: width,
      height: user.experiences.length == 0 || user.experiences.length == null
          ? user.experiences.length * 240.0 + 150
          : user.experiences.length * 240.0 + 50,
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
                delegate.jobs,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            user.experiences.length == 0 || user.experiences.length == null
                ? Container(
                    child: Center(
                      child: Text('No jobs ! Add Your jobs'),
                    ),
                  )
                : Flexible(
                    child: Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: user.experiences.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(user
                                                    .experiences[index]
                                                    .profile),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(user
                                                    .experiences[index]
                                                    .organization),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                    '(${user.experiences[index].startdate} -${user.experiences[index].enddate} )'),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  user.experiences[index]
                                                      .description,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                        ),
                                                        onPressed: () {}),
                                                  ),
                                                  Container(
                                                    child: IconButton(
                                                        icon: Icon(
                                                          Icons.delete,
                                                          color:
                                                              Theme.of(context)
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
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                              Theme.of(context)
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
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
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
                        MaterialPageRoute(builder: (ctx) => Job(isDarkk)));
                  },
                  child: Row(
                    children: [
                      Text(
                        delegate.add_jobs,
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
