import 'package:flutter/material.dart';
import 'package:sih/widgets/shared/inputdeco.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'InterView',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text('Question:'),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    decoration: InputDeco.copyWith(hintText: 'Answer'),
                    maxLines: 6,
                  )
                ],
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: height * 0.1,
        child: BottomAppBar(
          color: Theme.of(context).accentColor,
          child: FlatButton(
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
