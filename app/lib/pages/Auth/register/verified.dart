import 'package:flutter/material.dart';
import 'package:sih/pages/Auth/register/register.dart';

class Verified extends StatefulWidget {
  final String phone;
  Verified(this.phone);
  @override
  _VerifiedState createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> with TickerProviderStateMixin {
  bool circle = false;
  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _check().then((value) {
      setState(() {
        circle = true;
      });
      _controller = AnimationController(
          duration: const Duration(milliseconds: 3000), vsync: this);
      _controller.forward();
      _check().then((value) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => Registers(
                  phone: widget.phone,
                )));
      });
    });
  }

  Future<bool> _check() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: circle
            ? ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: _controller, curve: Curves.fastLinearToSlowEaseIn)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green[700],
                      child: Icon(
                        Icons.done,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        'You Are Verified',
                        style:
                            TextStyle(color: Colors.green[700], fontSize: 25),
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor),
                ),
              ),
      ),
    );
  }
}
