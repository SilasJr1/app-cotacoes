// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';
import 'fav-list.dart';
import 'portfolio-page.dart';

class CreateAssetPage extends StatefulWidget {
  const CreateAssetPage({Key? key}) : super(key: key);

  @override
  _CreateAssetPageState createState() => _CreateAssetPageState();
}

class _CreateAssetPageState extends State<CreateAssetPage> {
  var txtNome = TextEditingController();
  var txtCodigo = TextEditingController();
  var txtPreco = TextEditingController();

  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('ativos')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtCodigo.text = doc.get('ticker');
      txtPreco.text = doc.get('preco');
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID da Carteira e o ID do Ativo
    var args = ModalRoute.of(context)!.settings.arguments as AssetArguments;
    if (args.idAtivo != '') {
      if (txtNome.text.isEmpty &&
          txtCodigo.text.isEmpty &&
          txtPreco.text.isEmpty) {
        retornarDocumentoById(args.idAtivo);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ativo'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome', txtNome, Icons.description_rounded),
            const SizedBox(height: 20),
            campoTexto('Código', txtCodigo, FontAwesomeIcons.a),
            const SizedBox(height: 20),
            campoTexto(
                'Cotação Atual', txtPreco, Icons.monetization_on_rounded),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black87,
                    ),
                    child: const Text('Salvar'),
                    onPressed: () {
                      if (args.idAtivo == '') {
                        //Adicionar um novo documento
                        FirebaseFirestore.instance.collection('ativos').add({
                          "fid": args.idCarteira,
                          "nome": txtNome.text,
                          "ticker": txtCodigo.text,
                          "preco": txtPreco.text,
                        });
                        _sucesso('Ativo adicionado com sucesso.', args);
                      } else {
                        FirebaseFirestore.instance
                            .collection('ativos')
                            .doc(args.idAtivo)
                            .set({
                          "fid": args.idCarteira,
                          "nome": txtNome.text,
                          "ticker": txtCodigo.text,
                          "preco": txtPreco.text,
                        });
                        _sucesso('Ativo editado com sucesso.', args);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black87,
                      ),
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Colors.black87),
        prefixIconColor: Colors.black87,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.black87),
        border: const OutlineInputBorder(),
        focusColor: CustomTheme.loginGradientStart,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomTheme.loginGradientStart,
            width: 0.0,
          ),
        ),
      ),
    );
  }

  void _sucesso(String msg, AssetArguments args) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'portfolio',
                arguments: ScreenArguments(args.idCarteira, args.nomeCarteira),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
