// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:sih/pages/Auth/register/register.dart';
import 'package:sih/pages/Auth/register/verified.dart';
import 'package:sih/widgets/shared/inputdeco.dart';

class RegisterOtp extends StatefulWidget {
  @override
  _RegisterOtpState createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  final keymobile = GlobalKey<FormState>();
  String phone = '';
  String verificationId = "";
  String errorMessage = "";
  String status, otp, name;
  bool codes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: codes
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: status != null
                              ? Text(
                                  status,
                                  style: GoogleFonts.lustria(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        PinCodeTextField(
                          textInputType: TextInputType.phone,
                          activeColor: Theme.of(context).accentColor,
                          inactiveColor: Theme.of(context).accentColor,
                          length: 6,
                          obsecureText: false,
                          animationType: AnimationType.fade,
                          shape: PinCodeFieldShape.box,
                          animationDuration: Duration(milliseconds: 300),
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
                                signOtp(otp, verificationId);
                              },
                              child: Text(
                                'Verify',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {
                                verifyPhone(phone);
                              },
                              child: Text(
                                'Resend?',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
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
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: status != null
                              ? Text(
                                  status,
                                  style: GoogleFonts.lustria(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Form(
                      key: keymobile,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'enter Your Mobile number';
                                } else if (val.length < 10) {
                                  return 'Mobile number should be atleast 10 digits';
                                } else if (val.length > 10) {
                                  return 'Mobile number can\'t be more than 10 digits';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDeco.copyWith(
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor)),
                              onChanged: (val) {
                                setState(() {
                                  phone = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: FlatButton(
                                  onPressed: () {
                                    if (keymobile.currentState.validate()) {
                                      verifyPhone(phone);
                                      setState(() {
                                        codes = true;
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Generate OTP',
                                    style: TextStyle(color: Colors.white),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> verifyPhone(phone) async {
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

  signOtp(smsCode, verId) {
    AuthCredential auth = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(auth);
  }

  Future signIn(AuthCredential c) async {
    try {
      AuthResult r = await FirebaseAuth.instance.signInWithCredential(c);
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Verified(phone)));
    } on PlatformException catch (exp) {
      print(exp.code);
      setState(() {
        errorMessage = exp.message.toString();
      });
    }
  }
}
