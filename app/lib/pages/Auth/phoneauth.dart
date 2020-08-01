import 'package:flutter/material.dart';
import 'package:sih/pages/Auth/login/login.dart';
// import 'package:sih/pages/Auth/register/register.dart';
import 'package:sih/pages/Auth/register/register_otp.dart';
// import 'package:sih/pages/Auth/register/verified.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin:
            EdgeInsets.only(top: height / 2, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: height * 0.07,
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => RegisterOtp()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: height * 0.07,
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
