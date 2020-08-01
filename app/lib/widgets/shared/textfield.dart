import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final int maxlength;
  final int maxlines;
  final String text;
  Textfield(this.maxlength,this.maxlines,this.text);
  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:TextFormField(
                maxLength: widget.maxlength,
                maxLines: widget.maxlines,
                decoration:  InputDecoration(
                  hintText: widget.text,
                  hintStyle: TextStyle(color:Theme.of(context).highlightColor.withOpacity(0.4)),
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