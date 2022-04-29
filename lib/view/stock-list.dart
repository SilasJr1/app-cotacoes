// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/stock.dart';
import '../theme.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  //Lista dinâmica para armazenamento de objetos do modelo de dados Stock
  List<Stock> lista = [];

  //Carregar um arquivo JSON
  carregarJson() async {
    final String arquivo = await rootBundle.loadString('lib/data/stock.json');
    final data = await jsonDecode(arquivo);

    //Percorrer arquivo
    setState(() {
      data.forEach((item) {
        lista.add(Stock.fromJson(item));
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
          'Ações',
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
              leading: const Icon(FontAwesomeIcons.arrowTrendUp),
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
