// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class CreatePortfolioPage extends StatefulWidget {
  const CreatePortfolioPage({Key? key}) : super(key: key);

  @override
  _CreatePortfolioPageState createState() => _CreatePortfolioPageState();
}

class _CreatePortfolioPageState extends State<CreatePortfolioPage> {
  var txtNome = TextEditingController();
  var txtDescricao = TextEditingController();

  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('favoritos')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtDescricao.text = doc.get('descricao');
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID da carteira
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtNome.text.isEmpty && txtDescricao.text.isEmpty) {
        retornarDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome', txtNome, Icons.account_balance_wallet_rounded),
            const SizedBox(height: 20),
            campoTexto('Descrição', txtDescricao, Icons.description_rounded),
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
                      if (id == null) {
                        //Adicionar um novo documento
                        FirebaseFirestore.instance.collection('favoritos').add({
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "nome": txtNome.text,
                          "descricao": txtDescricao.text,
                        });
                        _sucesso('Carteira adicionada com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('favoritos')
                            .doc(id.toString())
                            .set({
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "nome": txtNome.text,
                          "descricao": txtDescricao.text,
                        });
                        _sucesso('Carteira editada com sucesso.');
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

  void _sucesso(String msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'fav');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
