import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nomeUsuario = "";

  @override
  Widget build(BuildContext context) {
    //Receber o argumento passado como parâmetro
    // final String nomeUsuario = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black87,
        leading: const Icon(
          Icons.home,
        ),
        title: FutureBuilder(
          future: retornarUsuarioLogado(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return Text(
                'Olá, ' + nomeUsuario,
                // style: const TextStyle(fontSize: 12),
              );
            }
          },
        ),
        backgroundColor: CustomTheme.loginGradientStart,
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'fav');
                  },
                  icon: const Icon(
                    FontAwesomeIcons.star,
                    color: Colors.black87,
                    size: 48,
                  ),
                  label: const Text(
                    ' Favoritos',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'currency');
                  },
                  icon: const Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Colors.black87,
                    size: 48,
                  ),
                  label: const Text(
                    'Moedas',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomTheme.loginGradientStart,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'stock');
                  },
                  icon: const Icon(
                    // FontAwesomeIcons.arrowTrendUp,
                    FontAwesomeIcons.chartLine,
                    color: Colors.black87,
                    size: 48,
                  ),
                  label: const Text(
                    ' Ações',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomTheme.loginGradientStart,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'crypto');
                  },
                  icon: const Icon(
                    FontAwesomeIcons.bitcoin,
                    color: Colors.black87,
                    size: 48,
                  ),
                  label: const Text(
                    ' Criptomoedas',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomTheme.loginGradientStart,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'sobre');
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Colors.black87,
                    size: 48,
                  ),
                  label: const Text(
                    ' Sobre o App',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomTheme.loginGradientStart,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  retornarUsuarioLogado() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then((q) {
      if (q.docs.isNotEmpty) {
        nomeUsuario = q.docs[0].data()['nome'];
      } else {
        nomeUsuario = "NENHUM";
      }
    });
  }
}
