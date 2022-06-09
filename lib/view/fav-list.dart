// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class FavList extends StatefulWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  dynamic carteiras;

  @override
  void initState() {
    super.initState();
    carteiras = FirebaseFirestore.instance
        .collection('favoritos')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
        ),
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        //
        // Exibir os documentos da Coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: carteiras.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black87,
        backgroundColor: CustomTheme.loginGradientStart,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'inserirCarteira');
        },
      ),
    );
  }

  exibirDocumento(item) {
    String nome = item.data()['nome'];
    String descricao = item.data()['descricao'];
    return ListTile(
      title: Text(nome),
      subtitle: Text(descricao),
      trailing: Wrap(children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              'inserirCarteira',
              arguments: item.id,
            );
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('favoritos')
                .doc(item.id)
                .delete();
            _modalDeletar();
          },
          icon: const Icon(Icons.delete_outline),
        ),
      ]),

      //PASSAR COMO ARGUMENTO O id da Carteira
      onTap: () {
        Navigator.pushNamed(
          context,
          'inserir',
          arguments: item.id,
        );
      },
    );
  }

  void _modalDeletar() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Carteira deletada com sucesso'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
