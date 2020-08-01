
import 'package:flutter/material.dart';

class NormalTextField extends StatefulWidget {
  final String text;
  NormalTextField(this.text);
  @override
  _NormalTextFieldState createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:TextFormField(
                decoration:  InputDecoration(
                  hintText: widget.text,
                  hintStyle: TextStyle(color:Theme.of(context).highlightColor),
                  fillColor:Colors.white,
                  filled:true,
                  enabledBorder:OutlineInputBorder(
                    borderSide:BorderSide(color: Theme.of(context).highlightColor.withOpacity(0.4),width:2.0)
                  ),
                   focusedBorder:OutlineInputBorder(
                    borderSide:BorderSide(color: Theme.of(context).accentColor,width:2.0)
                  )
                ),
              ), 
    );
  }
}