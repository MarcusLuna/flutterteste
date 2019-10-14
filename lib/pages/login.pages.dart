import 'package:flutter/material.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gif/models/user_model.dart';
import 'package:gif/pages/principal.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cadastrar.pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final _FormKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var controller =
        new MaskedTextController(text: 'CNPJ', mask: '00.000.000/0000-00');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Form(
              key: _FormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset("imagens/logo.png"),
                    ),
                    TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "CNPJ",
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(Icons.credit_card)),
                      // ignore: missing_return
                      validator: (text) {
                        if (text.isEmpty || text.length < 14)
                          return "CNPJ Inválido";
                      },
                    ),
                    Divider(),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(Icons.lock_outline)),
                      // ignore: missing_return
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha Inválido";
                      },
                    ),
                    FlatButton(
                      padding: const EdgeInsets.only(left: 250.0),
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    Divider(),
                    ButtonTheme(
                      height: 60.0,
                      minWidth: 360.0,
                      child: RaisedButton(
                        onPressed: () =>
                            {//if (_FormKey.currentState.validate()) {}
                            //model.signIn();
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage()))

                            },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: Colors.blue),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "Primeiro acesso ?",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => cadastrologin()));
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
