// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cotacoes/view/widgets/popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool _ocultarSenha = true;

  //Declaração das variáveis que serão usadas para armazenar
  //os dados informados pelo usuário
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();

  //Declaração de um atributo que identifica unicamente um formulário
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Form(
                key: formKey,
                child: Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: 300.0,
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            controller: txtLogin,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(fontSize: 17.0),
                            ),
                            //Validação dos dados
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Preenchimento obrigatório';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            controller: txtSenha,
                            obscureText: _ocultarSenha,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                FontAwesomeIcons.lock,
                                size: 22.0,
                                color: Colors.black,
                              ),
                              hintText: 'Senha',
                              hintStyle: const TextStyle(fontSize: 17.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSenha,
                                child: Icon(
                                  _ocultarSenha
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            //Validação dos dados
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Preenchimento obrigatório';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 230.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: CustomTheme.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: CustomTheme.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        CustomTheme.loginGradientEnd,
                        CustomTheme.loginGradientStart
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: CustomTheme.loginGradientEnd,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  onPressed: () => {
                    //validar formulário
                    if (formKey.currentState!.validate())
                      {
                        login(txtLogin.text, txtSenha.text)
                        // setState(() {
                        //   Navigator.pushNamed(context, 'home',
                        //       arguments: txtLogin.text);
                        // })
                      }
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: _esquecerSenhaButton,
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 40.0),
                child: TextButton(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.facebookF,
                        color: Color(0xFF0084ff),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login com Facebook acionado!'),
                          action: SnackBarAction(
                            label: 'Fechar',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login com Google acionado!'),
                          action: SnackBarAction(
                            label: 'Fechar',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      popup(context, 'Usuário autenticado com sucesso!', 'Seja bem-vindo(a)!',
          true);
      Navigator.pushReplacementNamed(context, 'home');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          popup(context, 'Erro ao autentificar usuário.',
              'O formato do e-mail é inválido', false);
          break;
        case 'user-not-found':
          popup(context, 'Erro ao autentificar usuário.',
              'Usuário não encontrado.', false);
          break;
        case 'wrong-password':
          popup(context, 'Erro ao autentificar usuário.', 'Senha incorreta.',
              false);
          break;
        default:
          popup(context, 'Erro ao autentificar usuário.', e.code.toString(),
              false);
          break;
      }
    });
  }

  void _esquecerSenhaButton() {
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

  void _toggleSenha() {
    setState(() {
      _ocultarSenha = !_ocultarSenha;
    });
  }
}
