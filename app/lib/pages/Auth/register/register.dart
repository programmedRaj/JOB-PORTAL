import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/api.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/pages/Auth/login/login.dart';
import 'dart:convert';
import 'dart:io';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;

class Registers extends StatefulWidget {
  final String phone;
  Registers({this.phone});
  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> with TickerProviderStateMixin {
  bool siz = false;
  final keyregister = GlobalKey<FormState>();
  AnimationController _controller;
  var w = 0.8;
  int type = 0;
  bool load = false;
  Api api = Api();
  String firstname, lastname, email, password;
  bool status = false;
  BaseUrl baseUrl = BaseUrl();
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _controller.forward();
  }

  // Future resumepost(
  //     String emaill, String contacts, String fname, String lname) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('token');
  //   prefs.setString('fname', fname);
  //   prefs.setString('lname', lname);

  //   var bodymsg = json.encode({
  //     "mode": "add",
  //     "email": emaill,
  //     "location": "",
  //     "phone_no": contacts,
  //     "additional_details": ""
  //   });

  //   var response = await retry(
  //     () => http
  //         .post(baseUrl.addresume,
  //             headers: {
  //               "Content-Type": "application/json",
  //               "Authorization": token
  //             },
  //             body: bodymsg)
  //         .timeout(Duration(seconds: 5)),
  //     retryIf: (e) => e is SocketException || e is TimeoutException,
  //   );

  //   print(response.statusCode);
  //   var k = response.body;
  //   var n = json.decode(k);
  //   print(n);
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (width <= 320.0) {
      setState(() {
        siz = true;
      });
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ClipPath(
                  child: Container(
                    height: height * 0.45,
                    width: width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      // image: DecorationImage(
                      //     image: AssetImage('assets/images/food1.jpeg'),
                      //     fit: BoxFit.cover)
                    ),
                  ),
                  clipper: BottomWaveClipper(),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -105),
                child: Container(
                  margin: EdgeInsets.only(right: 60),
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Join',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Us',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -60),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                    key: keyregister,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              ScaleTransition(
                                scale: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.bounceIn)),
                                child: Container(
                                  width: siz ? width * 0.35 : width * 0.41,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Your First Name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        firstname = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.2),
                                        filled: true,
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor
                                                    .withOpacity(0.2))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor)),
                                        hintText: 'First Name',
                                        hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: siz ? 15 : 20)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              ScaleTransition(
                                scale: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent:
                                            _controller,
                                        curve: Curves.bounceIn)),
                                child: Container(
                                  width: siz ? width * 0.42 : width * 0.41,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Your Last Name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        lastname = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.2),
                                        filled: true,
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .hintColor)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor)),
                                        hintText: 'Last Name',
                                        hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: siz ? 15 : 20)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ScaleTransition(
                          scale: Tween(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: _controller, curve: Curves.bounceIn)),
                          child: Container(
                            child: IgnorePointer(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                                initialValue: widget.phone,
                                decoration: InputDecoration(
                                    fillColor: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                    filled: true,
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .highlightColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor)),
                                    hintText: 'Mobile',
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: siz ? 15 : 20)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ScaleTransition(
                          scale: Tween(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: _controller, curve: Curves.bounceIn)),
                          child: Container(
                            child: TextFormField(
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Enter Your Email';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              decoration: InputDecoration(
                                  fillColor: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                  filled: true,
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .highlightColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: siz ? 15 : 20)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ScaleTransition(
                          scale: Tween(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: _controller, curve: Curves.bounceIn)),
                          child: Container(
                            child: TextFormField(
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Enter Your Password';
                                } else if (val.length < 6) {
                                  return 'Password should be atleast 6 digits';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                  filled: true,
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .highlightColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: siz ? 15 : 20)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ScaleTransition(
                            scale: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: _controller,
                                    curve: Curves.bounceIn)),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, top: 10, bottom: 2),
                              height: height * 0.08,
                              width: width * w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context).primaryColor),
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: FlatButton(
                                onPressed: () async {
                                  if (keyregister.currentState.validate()) {
                                    setState(() {
                                      w = 0.2;

                                      type = 1;
                                    });
                                    // resumepost(email, widget.phone, firstname,
                                    //     lastname);
                                    var apival = await api.register(
                                        fname: firstname,
                                        lname: lastname,
                                        email: email,
                                        passw: password,
                                        contact: widget.phone);

                                    if (apival != null) {
                                      Timer(Duration(seconds: 5), () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            duration:
                                                Duration(milliseconds: 700),
                                            type:
                                                PageTransitionType.leftToRight,
                                            child: Login(),
                                          ),
                                        );
                                        setState(() {
                                          w = 0.2;
                                          type = 2;
                                        });
                                        Timer(Duration(seconds: 3), () {
                                          setState(() {
                                            w = 0.8;
                                            type = 0;
                                          });
                                        });
                                      });
                                    }
                                  }
                                },
                                child: type == 0
                                    ? Text(
                                        'Register',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20),
                                      )
                                    : type == 1
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : Icon(
                                            Icons.done,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 28,
                                          ),

                                // child: load == true
                                //     ? loadd
                                //         ? CircularProgressIndicator(
                                //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                //           )
                                //         : Icon(
                                //             Icons.done,
                                //             color:Theme.of(context).primaryColor,
                                //           )
                                //     : Text(
                                //         widget.name,
                                //         style: TextStyle(color:Theme.of(context).primaryColor, fontSize: 20),
                                //       )
                              ),
                            )
                            //  Button(
                            //     'Register',
                            //     PageTransitionType.rightToLeft,
                            //     Theme.of(context).accentColor,
                            //     Colors.white,
                            //     Login(),
                            //     true)

                            ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.5, size.height - 60.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 150);
    var secondEndPoint = Offset(size.width, size.height - 150);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
