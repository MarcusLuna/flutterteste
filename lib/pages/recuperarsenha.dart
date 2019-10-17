import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class recuperar extends StatefulWidget {
  @override
  _recuperarState createState() => _recuperarState();
}

final _FormKey = GlobalKey<FormState>();

class _recuperarState extends State<recuperar> {
  @override
  Widget build(BuildContext context) {
    var controller =
        new MaskedTextController(text: 'CNPJ', mask: '00.000.000/0000-00');
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Form(
            key: _FormKey,
            child: SingleChildScrollView(
              padding: new EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset("imagens/logo.png"),
                  ),
                  TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "E-MAIL",
                        labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                        icon: Icon(Icons.alternate_email)),
                    // ignore: missing_return
                    validator: (text) {
                      if (text.isEmpty || text.contains('@'))
                        return "E-MAIL Inválido";
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonTheme(
                    height: 60.0,
                    minWidth: 360.0,
                    child: RaisedButton(
                      onPressed: () =>
                          {if (_FormKey.currentState.validate()) {}},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Recuperar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
