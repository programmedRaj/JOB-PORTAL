import 'package:flutter/material.dart';
import 'package:sih/api/models/user.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/pages/Home/resume/add/projects.dart';
import 'package:sih/provider/userprovider.dart';
import 'package:url_launcher/url_launcher.dart';

class Projectsec extends StatefulWidget {
  final UserProvider user;
  final bool isDarkk;
  const Projectsec(this.user, this.isDarkk);
  @override
  _ProjectsecState createState() => _ProjectsecState();
}

class _ProjectsecState extends State<Projectsec> {
  @override
  Widget build(BuildContext context) {
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final delegate = S.of(context);
    final user = widget.user;
    return Container(
      width: width,
      height: user.projects.length == 0 || user.projects.length == null
          ? user.projects.length * 240.0 + 150
          : user.projects.length * 240.0 + 50,
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
                delegate.Project,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            user.projects.length == 0 || user.projects.length == null
                ? Container(
                    child: Center(
                      child: Text('No Projects ! Add Your Projects'),
                    ),
                  )
                : Flexible(
                    child: Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: user.projects.length,
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
                                            margin: EdgeInsets.all(5),
                                            child: Text(
                                                user.projects[index].title),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            width: width * 0.4,
                                            child: Text(
                                              user.projects[index].description,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.all(5),
                                              child: Text(
                                                  '22-04-2020 - 23-05-2020') // '(${user.training[index].startdate} -${user.training[index].enddate} )'),
                                              ),
                                          GestureDetector(
                                            onTap: () async {
                                              if (await canLaunch(user
                                                  .projects[index]
                                                  .projectlink)) {
                                                await launch(user
                                                    .projects[index]
                                                    .projectlink);
                                              } else {
                                                throw 'Could not launch ${user.projects[index].projectlink}';
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                user.projects[index]
                                                    .projectlink,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.blue[300]),
                                              ),
                                            ),
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
                        builder: (ctx) => Projectss(isDarkk)));
                  },
                  child: Row(
                    children: [
                      Text(
                        delegate.add_project,
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
