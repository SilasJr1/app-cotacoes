import 'package:flutter/material.dart';

import '../theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Receber o argumento passado como parâmetro
    final String nome = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, ' + nome,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomTheme.loginGradientStart,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [Card()],
        ),
      ),
    );
  }
}
