// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/currency.dart';
import '../theme.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  //Lista dinâmica para armazenamento de objetos do modelo de dados Currency
  List<Currency> lista = [];

  //Carregar um arquivo JSON
  carregarJson() async {
    final String arquivo =
        await rootBundle.loadString('lib/data/currency.json');
    final data = await jsonDecode(arquivo);

    //Percorrer arquivo
    setState(() {
      data.forEach((item) {
        lista.add(Currency.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Moedas',
        ),
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(FontAwesomeIcons.moneyBill1),
              trailing: const Icon(Icons.arrow_right),
              title: Text(lista[index].nome),
              subtitle: Text('Código: ${lista[index].codigo}'),
              tileColor: index.isOdd ? Colors.black12 : Colors.white,
              onTap: _modal,
            );
          },
        ),
      ),
    );
  }

  void _modal() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Esta função será implementada em breve'),
        content: const Text(
            'Qualquer dúvida entre em contato pelo e-mail silas.henrique@gmail.com'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
