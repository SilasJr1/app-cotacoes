// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'fav-list.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  dynamic ativos;

  retornarDocumentosById(id) async {
    ativos = FirebaseFirestore.instance
        .collection('ativos')
        .where('fid', isEqualTo: id);
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID e o nome da carteira
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    retornarDocumentosById(args.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.nome,
        ),
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, 'fav');
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        //
        // Exibir os documentos da Coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: ativos.snapshots(),
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
                    return exibirDocumento(dados.docs[index], args);
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
          Navigator.pushNamed(
            context,
            'inserirAtivo',
            arguments: AssetArguments(args.id, '', args.nome),
          );
        },
      ),
    );
  }

  exibirDocumento(item, ScreenArguments args) {
    String nome = item.data()['nome'];
    String ticker = item.data()['ticker'];
    String preco = item.data()['preco'];
    return ListTile(
      title: Text(nome),
      subtitle: Text('Código: $ticker - Cotação atual: $preco'),
      trailing: Wrap(children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              'inserirAtivo',
              arguments: AssetArguments(args.id, item.id, args.nome),
            );
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('ativos')
                .doc(item.id)
                .delete();
            _modalDeletar();
          },
          icon: const Icon(Icons.delete_outline),
        ),
      ]),

      //PASSAR COMO ARGUMENTO O id do Ativo
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   'asset',
        //   arguments: item.id,
        // );
      },
    );
  }

  void _modalDeletar() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Ativo deletado com sucesso'),
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

class AssetArguments {
  final String idCarteira;
  final String idAtivo;
  final String nomeCarteira;

  AssetArguments(this.idCarteira, this.idAtivo, this.nomeCarteira);
}
