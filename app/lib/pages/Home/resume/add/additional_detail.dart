import 'package:flutter/material.dart';
import 'package:sih/language/generated/l10n.dart';
import 'package:sih/widgets/shared/savebutton.dart';
import 'package:sih/widgets/shared/textfield.dart';

class Additional extends StatefulWidget {
  final bool isDarkk;
  Additional(this.isDarkk);
  @override
  _AdditionalState createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    bool isDarkk = widget.isDarkk;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(
          delegate.add_add_details,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      delegate.additional_detials,
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                Textfield(250, 6, ''),
                SizedBox(
                  height: height * 0.02,
                ),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
