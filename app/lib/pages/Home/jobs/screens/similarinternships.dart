import 'package:flutter/material.dart';

import '../../../../main.dart';

class Similar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 200),
                child: CircleAvatar(
                  child: Icon(
                    Icons.done,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  radius: 50,
                  backgroundColor: Theme.of(context).accentColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Text(
                  'You Have Successful applied for this job',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
