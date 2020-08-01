import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/api/service/api.dart';
import 'package:sih/api/service/baseurl.dart';
import 'package:sih/pages/Auth/register/register_otp.dart';
import 'package:sih/pages/Home/home.dart';
import 'package:sih/provider/token.dart';
import 'package:sih/widgets/animated/button.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _controller;
  final keyLogin = GlobalKey<FormState>();
  bool type1 = false;
  bool codes = false;
  bool button1 = true;
  var w = 0.8;
  int type = 0;
  bool load = false;
  int logintype = 1;
  String contact, password;
  Api api = Api();
  String verificationId = "";
  String errorMessage = "";
  String status, otp, name, serverMessage;
  BaseUrl baseUrl = BaseUrl();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _controller.forward();
  }

  // ignore: missing_return
  Future<Login> login(
      int logintype, String contact, String password, Token tokens) async {
    var bodymsg = logintype == 1
        ? json.encode(
            {"password": password, "type": logintype, "contact": contact})
        : json.encode({"type": logintype, "contact": contact});

    print(contact);
    print(type);
    await retry(
      () => http
          .post(baseUrl.login,
              headers: {"Content-Type": "application/json"}, body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    ).then((value) async {
      print(value.statusCode);
      var k = value.body;
      var convert = json.decode(k);
      var token = convert["token"];
      tokens.toke(token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      if (logintype == 1) {
        if (value.statusCode == 200) {
          return Timer(Duration(seconds: 5), () {
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 700),
                type: PageTransitionType.leftToRight,
                child: Home(),
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
        } else if (value.statusCode == 401) {
          setState(() {
            serverMessage = 'phone number or password incorrect';
          });
        } else if (value.statusCode == 500) {
          setState(() {
            serverMessage = 'something went wrong';
          });
        } else {}
      } else if (logintype == 0) {
        if (value.statusCode == 200) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Home()));
        } else if (value.statusCode == 401) {
          setState(() {
            print('here i am');
            errorMessage = 'Phone Number Does not Exists';
          });
        } else if (value.statusCode == 500) {
          errorMessage = 'something went wrong';
        }
      }
    });

    // print(value.body);
    // var convert = json.decode(response.body);
    // // print(convert['token']);
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   return null;
    // } else if (response.statusCode == 401) {
    // } else {
    //   return null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var token = Provider.of<Token>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ClipPath(
                child: Container(
                  height: height * 0.4,
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
              offset: Offset(0, -95),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Job-Setu',
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Form(
                key: keyLogin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: _controller, curve: Curves.bounceIn)),
                      child: Container(
                        child: codes
                            ? Column(
                                children: [
                                  PinCodeTextField(
                                    textInputType: TextInputType.phone,
                                    activeColor: Theme.of(context).accentColor,
                                    inactiveColor:
                                        Theme.of(context).accentColor,
                                    length: 6,
                                    obsecureText: false,
                                    animationType: AnimationType.fade,
                                    shape: PinCodeFieldShape.box,
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    onChanged: (value) {
                                      setState(() {
                                        otp = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Theme.of(context).accentColor,
                                    child: FlatButton(
                                        onPressed: () {
                                          signOtp(otp, verificationId,
                                              logintype, contact, token);
                                        },
                                        child: Text(
                                          'Verify',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          verifyPhone(contact);
                                        },
                                        child: Text(
                                          'Resend?',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor),
                                        )),
                                  ),
                                  errorMessage == null
                                      ? null
                                      : Text(
                                          errorMessage,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w400),
                                        )
                                ],
                              )
                            : Column(
                                children: [
                                  TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        contact = val;
                                      });
                                    },
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Your Mobile number';
                                      }
                                      // } else if (val.length < 11) {
                                      //   return 'Mobile number should be atleast 10 digits';
                                      // } else if (val.length > 10) {
                                      //   return 'Mobile number can\'t be more than 10 digits';
                                      // }
                                      else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Number',
                                        hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  type1
                                      ? Container(
                                          margin: EdgeInsets.all(20),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).accentColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: FlatButton(
                                              onPressed: () {
                                                if (keyLogin.currentState
                                                    .validate()) {
                                                  verifyPhone(contact);
                                                  setState(() {
                                                    codes = true;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                'Generate OTP',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        )
                                      : Container()
                                ],
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
                        child: type1
                            ? Text(
                                'Login with OTP if you want to Login with Password turn switch off')
                            : Column(
                                children: [
                                  TextFormField(
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() {
                                        password = val;
                                      });
                                    },
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Your Password';
                                      } else if (val.length < 3) {
                                        return 'Password should be atleast 6 digits';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      'If You Forget Password you can login with otp'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: serverMessage == null
                                        ? Container()
                                        : Text(
                                            serverMessage,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .errorColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: codes
                          ? Container()
                          : Switch(
                              value: type1,
                              onChanged: (val) {
                                setState(() {
                                  type1 = val;
                                });
                                if (type1) {
                                  setState(() {
                                    logintype = 0;
                                    print(logintype);
                                  });
                                } else {
                                  setState(() {
                                    logintype = 1;
                                  });
                                  print(logintype);
                                }
                              }),
                    ),
                    ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: _controller, curve: Curves.bounceIn)),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: type1
                              ? Container()
                              : FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ))),
                    ),
                    ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: _controller, curve: Curves.bounceIn)),
                        child: Container(
                          child: type1
                              ? Container()
                              : AnimatedContainer(
                                  duration: Duration(milliseconds: 1000),
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, top: 10, bottom: 2),
                                  height: height * 0.08,
                                  width: width * w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4,
                                          color:
                                              Theme.of(context).primaryColor),
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: FlatButton(
                                    onPressed: () {
                                      if (keyLogin.currentState.validate()) {
                                        setState(() {
                                          w = 0.2;

                                          type = 1;
                                        });
                                        login(logintype, contact, password,
                                            token);
                                      }
                                    },
                                    child: type == 0
                                        ? Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 20),
                                          )
                                        : type == 1
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              )
                                            : Icon(
                                                Icons.done,
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                ),
                        )),
                    ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: _controller, curve: Curves.bounceIn)),
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Button(
                                'New Here?',
                                PageTransitionType.rightToLeft,
                                Theme.of(context).accentColor,
                                Theme.of(context).primaryColor,
                                RegisterOtp(),
                                false)))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> verifyPhone(phone) async {
    print(phone);
    try {
      final PhoneVerificationCompleted verified = (AuthCredential authR) async {
        setState(() {
          errorMessage = 'Auto retrieving verification code';
        });
        try {
          AuthResult value =
              await FirebaseAuth.instance.signInWithCredential(authR);
        } on PlatformException catch (e) {
          setState(() {
            errorMessage = e.message;
          });
        }
      };
      final PhoneVerificationFailed verifaild = (AuthException authException) {
        setState(() {
          errorMessage = '${authException.message}';

          print("Error message: " + errorMessage);
          if (authException.message.contains('not authorized'))
            errorMessage = 'Something has gone wrong, please try later';
          else if (authException.message.contains('Network'))
            errorMessage =
                'Please check your internet connection and try again';
          else
            errorMessage = 'Something has gone wrong, please try later';
        });
      };
      final PhoneCodeSent smsOTP = (String verId, [int forceResend]) {
        this.verificationId = verId;
        setState(() {
          this.codes = true;
          status = "code is sent to" + '+91' + phone;
        });
      };
      final PhoneCodeAutoRetrievalTimeout out = (String verId) {
        this.verificationId = verId;
        setState(() {
          status = 'timeout';
        });
      };

      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91' + phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: verified,
          verificationFailed: verifaild,
          codeSent: smsOTP,
          codeAutoRetrievalTimeout: out);
    } on PlatformException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  signOtp(smsCode, verId, logintype, contact, token) {
    AuthCredential auth = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(auth, logintype, contact, token);
  }

  Future signIn(
      AuthCredential c, int logintype, String contact, Token token) async {
    try {
      AuthResult r = await FirebaseAuth.instance.signInWithCredential(c);
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));

      login(logintype, contact, '', token);
      // if (apival != null) {
      //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
      // }
    } on PlatformException catch (exp) {
      print(exp.code);
      setState(() {
        errorMessage = exp.message.toString();
      });
    }
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 2);

    var firstControlPoint = Offset(size.width / 4, size.height - 150);
    var firstEndPoint = Offset(size.width / 2.0, size.height - 60.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height);
    var secondEndPoint = Offset(size.width, size.height - 60);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
