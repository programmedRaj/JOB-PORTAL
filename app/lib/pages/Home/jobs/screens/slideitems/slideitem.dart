import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';
import 'package:sih/provider/question.dart';

class SlideItem extends StatelessWidget {
  final int index;
  final double height;
  final double width;
  SlideItem(this.index, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    final qna = Provider.of<Question>(context);
    for (int i = 0; i < qna.slides.length; i++) {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              qna.slides[i].question,
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RadioButtonGroup(labels: <String>[
              "Option 1",
              "Option 2",
              "Option 3",
              "Option 4"
            ], onSelected: (String selected) => print(selected)),
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 35),
                child: Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(onPressed: () {}, child: Text('Submit')),
                ))
          ],
        ),
      );
    }
  }
}
