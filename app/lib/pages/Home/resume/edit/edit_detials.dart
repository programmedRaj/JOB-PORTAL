import 'package:flutter/material.dart';
import 'package:sih/widgets/shared/normaltext.dart';
import 'package:sih/widgets/shared/savebutton.dart';

class PersonalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Personal Details',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Details',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('First Name'),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('Last Name'),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('Email'),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('Number'),
              SizedBox(
                height: height * 0.02,
              ),
              NormalTextField('Location'),
              SizedBox(
                height: height * 0.02,
              ),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
