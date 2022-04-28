import 'package:flutter/material.dart';

import 'view/login.dart';
import 'view/home.dart';
import 'view/sobre.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Alpha Assets',
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'home': (context) => Home(),
      'sobre': (context) => Sobre(),
    },
  ));
}
