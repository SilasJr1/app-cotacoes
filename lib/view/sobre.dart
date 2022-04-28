import 'package:flutter/material.dart';

import '../theme.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre o App',
        ),
        backgroundColor: CustomTheme.loginGradientStart,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Este projeto em Flutter foi feito para a Disciplina Eletiva "Programação para Dispositivos Móveis", lecionada na Fatec Ribeirão Preto no primeiro semestre de 2022.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Tema escolhido: Aplicativo de cotações de ativos financeiros.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'O objetivo deste app é mostrar ao usuário cotações atuais de ativos financeiros (ações, títulos públicos, criptomoedas etc.), assim como sua evolução ao longo do tempo através de gráficos.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Autor: Silas Henrique Gonçalves Júnior',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/62074890?s=400&u=36d72d7215f827fabfd099bc03a9b47a1db48f1d&v=4'),
                // radius: MediaQuery.of(context).size.width * 0.3,
                minRadius: 70,
                maxRadius: 140,
              ),
            )
          ],
        ),
      ),
    );
  }
}
