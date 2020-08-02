import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/services.dart';
import 'package:permission/permission.dart';
import 'package:sih/pages/Home/video/pages/call.dart';

// import 'package:permission_handler/permission_handler.dart';

class IndexPage extends StatefulWidget {
  final bool isDark;
  IndexPage(this.isDark);
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> with SingleTickerProviderStateMixin {
  bool camera = false;
  bool microphone = false;
  String message;
  bool granted = false;

  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();
  // PermissionStatus _status;

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkk = widget.isDark;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: isDarkk
            ? Theme.of(context).accentColor
            : Theme.of(context).hintColor.withOpacity(0.4),
        title: Text(
          'Online-Interview',
          style: GoogleFonts.workSans(
            textStyle:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Theme.of(context).accentColor),
                      controller: _channelController,
                      decoration: InputDecoration(
                          errorText: _validateError ? 'ID is mandatory' : null,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          hintText: 'Unique ID By Interviewer',
                          hintStyle:
                              TextStyle(color: Theme.of(context).accentColor)),
                    ))
                  ],
                ),
                // Column(
                //   children: [
                //     ListTile(
                //       title: Text(ClientRole.Broadcaster.toString()),
                //       leading: Radio(
                //         value: ClientRole.Broadcaster,
                //         groupValue: _role,
                //         onChanged: (ClientRole value) {
                //           setState(() {
                //             _role = value;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: onJoin,
                          child: Text('Join'),
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    if (_channelController.text.isNotEmpty) {
      setState(() {
        camera = true;
        microphone = true;
      });
      _requestPerms();
      if (granted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallPage(
              channelName: _channelController.text,
              role: ClientRole.Broadcaster,
              isDarkk: widget.isDark,
            ),
          ),
        );
      }
    }
  }

// Future<void> _handleCameraAndMic() async {}
  void _requestPerms() async {
    List<PermissionName> permissionNames = [];

    if (camera) permissionNames.add(PermissionName.Camera);
    if (microphone) permissionNames.add(PermissionName.Microphone);
    message = '';
    var permissions = await Permission.requestPermissions(permissionNames);
    permissions.forEach((permission) {
      message +=
          '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
    setState(() {
      granted = true;
    });
  }
}
