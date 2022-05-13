import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'view/login.dart';
import 'view/home.dart';
import 'view/sobre.dart';
import 'view/crypto-list.dart';
import 'view/currency-list.dart';
import 'view/stock-list.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Alpha Assets',
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'home': (context) => Home(),
      'sobre': (context) => Sobre(),
      'crypto': (context) => CryptoList(),
      'currency': (context) => CurrencyList(),
      'stock': (context) => StockList(),
    },
  ));
}
