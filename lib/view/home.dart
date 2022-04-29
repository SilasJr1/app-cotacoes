import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    // const String nome = "Silas";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black87,
        leading: const Icon(
          Icons.home,
        ),
        title: Text(
          'Olá, ' + nome,
        ),
        backgroundColor: CustomTheme.loginGradientStart,
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
                    'Ações',
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
                    'Criptomoedas',
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
                    'Sobre o App',
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
}
