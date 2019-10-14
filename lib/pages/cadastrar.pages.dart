import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class cadastrologin extends StatefulWidget {
  @override
  _cadastrologinState createState() => _cadastrologinState();
}
final _FormKey = GlobalKey<FormState>();
class _cadastrologinState extends State<cadastrologin> {
  @override
  Widget build(BuildContext context) {
    var controller =
    new MaskedTextController(text: 'CNPJ', mask: '00.000.000/0000-00');
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child:Form(
            key: _FormKey,
            child: SingleChildScrollView(
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
                    keyboardType: TextInputType.number,
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "CNPJ",
                        labelStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.credit_card)
                    ),

                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty || text.length<14)
                        return "CNPJ Inválido";
                    },
                  ),
                  Divider(),
                  TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "E-MAIL",
                        labelStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.alternate_email)),
                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty || text.contains('@'))
                        return "E-MAIL Inválido";
                    },
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 60.0,
                    minWidth: 360.0,
                    child: RaisedButton(
                      onPressed: () => {
                        if(_FormKey.currentState.validate()){

                        }

                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Cadastrar",
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
