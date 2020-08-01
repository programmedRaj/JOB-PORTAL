import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetial extends StatelessWidget {
  final int courseid;
  final String coursename;
  final String courseimage;
  final String courselink;
  const ProductDetial({
    Key key,
    this.courseid,
    this.coursename,
    this.courseimage,
    this.courselink,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/pngwave.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: width * 0.8,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          coursename,
                          maxLines: 4,
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      //-------------------------------------------------------------------------
      bottomNavigationBar: Container(
        height: height * 0.1,
        child: BottomAppBar(
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: height,
                  width: width,
                  child: FlatButton(
                      onPressed: () async {
                        if (await canLaunch(courselink)) {
                          await launch(courselink);
                        } else {
                          throw 'Could not launch ';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Enroll',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.shopping_cart,
                              color: Theme.of(context).primaryColor)
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Future dailog(BuildContext context, String val, Widget data, String title) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(val.toString()),
            content: Container(
              child: Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) => data));
                      },
                      child: Text(title)),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close')),
                ],
              ),
            ),
          );
        });
  }
}
