import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';

class Mycourse extends StatelessWidget {
  //ye response.body mai list hai na?
  final bool isDarkk;
  const Mycourse(
    this.isDarkk,
  );
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final delegate = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          delegate.my_co,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                  height: height * 0.2,
                  width: width,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                  decoration: BoxDecoration(
                      color: isDarkk
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor.withOpacity(0.6),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).highlightColor,
                            blurRadius: 4)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width * 0.3,
                        color: Colors.blue,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Course Name:',
                                style: TextStyle(
                                    color: Theme.of(context).highlightColor),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // Container(
                            //   height: height * 0.05,
                            //   width: width * 0.45,
                            //   child: LiquidLinearProgressIndicator(
                            //     value: 0.5, // Defaults to 0.5.
                            //     valueColor: AlwaysStoppedAnimation(Theme.of(
                            //             context)
                            //         .accentColor), // Defaults to the current Theme's accentColor.
                            //     backgroundColor: Colors
                            //         .white, // Defaults to the current Theme's backgroundColor.
                            //     borderColor: Colors.blue,
                            //     borderWidth: 5.0,
                            //     borderRadius: 12.0,
                            //     direction: Axis
                            //         .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                            //     center: Text(
                            //       "50%",
                            //       style: TextStyle(
                            //           color: Theme.of(context).highlightColor,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.3),
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    delegate.view_more,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
