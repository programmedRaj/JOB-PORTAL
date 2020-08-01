import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Button extends StatefulWidget {
  final String name;
  final PageTransitionType types;
  final Color color1;
  final Color color2;
  final Widget wid;
  final bool sizee;
  Button(
    this.name,
    this.types,
    this.color1,
    this.color2,
    this.wid,
    this.sizee,
  );

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var w = 0.8;
  bool load = false;
  int type = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 2),
      height: height * 0.08,
      width: width * w,
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Theme.of(context).primaryColor),
          color: widget.color1,
          borderRadius: BorderRadius.circular(50)),
      child: FlatButton(
        onPressed: () {
          if (widget.sizee == true) {
            setState(() {
              w = 0.2;

              type = 1;
            });
            Timer(Duration(seconds: 5), () {
              Navigator.push(
                context,
                PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: widget.types,
                  child: widget.wid,
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
          } else {
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 700),
                type: widget.types,
                child: widget.wid,
              ),
            );
          }
        },
        child: type == 0
            ? Text(
                widget.name,
                style: TextStyle(color: widget.color2, fontSize: 20),
              )
            : type == 1
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Icon(
                    Icons.done,
                    color: widget.color2,
                    size: 28,
                  ),

        // child: load == true
        //     ? loadd
        //         ? CircularProgressIndicator(
        //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //           )
        //         : Icon(
        //             Icons.done,
        //             color: widget.color2,
        //           )
        //     : Text(
        //         widget.name,
        //         style: TextStyle(color: widget.color2, fontSize: 20),
        //       )
      ),
    );
  }
}
