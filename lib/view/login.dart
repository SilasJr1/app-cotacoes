import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../theme.dart';
import './widgets/form-login.dart';
import './widgets/form-cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  CustomTheme.loginGradientStart,
                  CustomTheme.loginGradientEnd
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Image(
                    height:
                        MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                    fit: BoxFit.fill,
                    image: const AssetImage('assets/img/login_logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const FormLogin(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const FormCadastro(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold'),
              ),
            ),
          ),
          //Container(height: 33.0, width: 1.0, color: Colors.white),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
