import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gif/models/user_model.dart';
import 'package:gif/pages/principal.dart';
import 'package:gif/pages/recuperarsenha.dart';
import 'package:scoped_model/scoped_model.dart';
import 'cadastrar.pages.dart';
import 'package:gif/soaplogin/soap.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}
final _ctrlLogin = TextEditingController();
final _ctrlSenha = TextEditingController();
final _FormKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
   // var controller =
       // new MaskedTextController(text: 'CNPJ', mask: '00.000.000/0000-00');
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
                padding: new EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset("imagens/logo.png"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "CNPJ",
                          labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                          icon: Icon(Icons.person)),
                      // ignore: missing_return
                      controller: _ctrlLogin,
                      validator: (text) {
                        if (text.isEmpty )
                          return "CNPJ Inválido";

                      },

                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400),
                          icon: Icon(Icons.lock_outline)),
                      // ignore: missing_return
                      controller: _ctrlSenha,
                      validator: (text) {
                        if (text.isEmpty )
                          return "Senha Inválido";
                      },
                    ),
                    FlatButton(
                      padding: const EdgeInsets.only(left: 240.0),
                      child: Text(
                        "Recuperar senha",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => recuperar()));
                      },
                    ),
                    ButtonTheme(
                      height: 60.0,
                      minWidth: 360.0,
                      child: RaisedButton(
                        onPressed: () {
                          _clickButton(context);
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
                        style: TextStyle(fontSize: 10.0),
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
  _clickButton(BuildContext context) async {
    bool formOk = _FormKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String Email = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    print("login : $Email senha: $senha");

    var response = await teste3.login(Email,senha);

    if(response){
      _navegaHomepage(context);
    }

  }

  _navegaHomepage(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(
        builder : (context)=> HomePage()),
    );
  }
}
