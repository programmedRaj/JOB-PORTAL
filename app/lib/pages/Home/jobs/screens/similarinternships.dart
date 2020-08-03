import 'package:flutter/material.dart';

class Similar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text('You Have Successful applied for this job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
