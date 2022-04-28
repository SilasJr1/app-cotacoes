// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/crypto.dart';
import '../theme.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  //Lista dinâmica para armazenamento de objetos do modelo de dados Crypto
  List<Crypto> lista = [];

  //Carregar um arquivo JSON
  carregarJson() async {
    final String arquivo = await rootBundle.loadString('lib/data/crypto.json');
    final data = await jsonDecode(arquivo);

    //Percorrer arquivo
    setState(() {
      data.forEach((item) {
        lista.add(Crypto.fromJson(item));
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
          'Criptomoedas',
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
              leading: const Icon(FontAwesomeIcons.coins),
              trailing: const Icon(Icons.arrow_right),
              title: Text(lista[index].nome),
              subtitle: Text('Código: ${lista[index].codigo}'),
              tileColor: index.isOdd ? Colors.black12 : Colors.white,
            );
          },
        ),
      ),
    );
  }
}
