// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cotacoes/view/widgets/popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({Key? key}) : super(key: key);

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool _ocultarSenha = true;
  bool _ocultarConfirmacaoSenha = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: txtNome,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                            ),
                            hintText: 'Nome',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                            ),
                            hintText: 'E-mail',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: txtSenha,
                          obscureText: _ocultarSenha,
                          autocorrect: false,
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText: 'Senha',
                            hintStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSenha,
                              child: Icon(
                                _ocultarSenha ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          obscureText: _ocultarConfirmacaoSenha,
                          autocorrect: false,
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText: 'Confirmação de senha',
                            hintStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: _toggleConfirmacaoSenha,
                              child: Icon(
                                _ocultarConfirmacaoSenha
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {},
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340.0),
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
                      colors: <Color>[CustomTheme.loginGradientEnd, CustomTheme.loginGradientStart],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: CustomTheme.loginGradientEnd,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'CADASTRAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  onPressed: () => criarConta(txtNome.text, txtEmail.text, txtSenha.text),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha).then((res) {
      //Armazenar o nome no Firestore
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": nome,
      });
      popup(context, 'Usuário criado com sucesso', 'Seja bem-vindo(a)!', true);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          popup(context, 'Erro ao cadastrar usuário', 'O e-mail já foi cadastrado!', false);
          break;
        case 'invalid-email':
          popup(context, 'Erro ao cadastrar usuário', 'E-mail inválido!', false);
          break;
        case 'weak-password':
          popup(context, 'Erro ao cadastrar usuário', 'A senha deve conter no mínimo 6 dígitos',
              false);
          break;
        default:
          popup(context, 'Erro ao cadastrar usuário', e.code.toString(), false);
          break;
      }
    });
  }

  void _toggleSenha() {
    setState(() {
      _ocultarSenha = !_ocultarSenha;
    });
  }

  void _toggleConfirmacaoSenha() {
    setState(() {
      _ocultarConfirmacaoSenha = !_ocultarConfirmacaoSenha;
    });
  }
}
