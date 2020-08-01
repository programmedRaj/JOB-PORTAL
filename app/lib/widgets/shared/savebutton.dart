
import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
     var height =  MediaQuery.of(context).size.height;
     var width =  MediaQuery.of(context).size.width;
   
    return Container(
      width:width ,
      height: height*0.07,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: FlatButton(onPressed: (){

      }, child: Text('Save',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18)))
    );
  }
}