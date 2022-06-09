import 'package:flutter/material.dart';

void popup(BuildContext context, String title, String msg, bool success) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (success) {
              Navigator.pushNamed(context, 'login');
            } else {
              Navigator.pop(context, 'OK');
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
