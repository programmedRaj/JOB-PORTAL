import 'package:flutter/material.dart';

import 'jobs/apply_job.dart';

const messages = [
  'Hey! What’s up?',
  'Do you want some chips with your sandwich?',
  'Hey you Have been Selected For This job',
  'Hey you Have been Selected For This job',
  'if you like it, please go to github give him a star',
];

class MessageNotification extends StatelessWidget {
  final VoidCallback onReply;
  final bool isDark;
  final String message;

  const MessageNotification({
    Key key,
    this.isDark,
    @required this.onReply,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
          ),
          title: Text('Congratulations'),
          subtitle: Text(message),
          trailing: IconButton(
              icon: Icon(Icons.reply),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AppliedJobs(isDark)));
              }),
        ),
      ),
    );
  }
}
