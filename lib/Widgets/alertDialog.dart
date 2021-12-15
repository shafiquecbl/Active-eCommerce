import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

confirmExitApp(BuildContext context) {
  return Alert(
    useRootNavigator: false,
    context: context,
    type: AlertType.warning,
    title: "EXIT APP",
    desc: "Do you want to close app?",
    buttons: [
      DialogButton(
        child: Text(
          "No",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          "Yes",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => exit(0),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();
}
