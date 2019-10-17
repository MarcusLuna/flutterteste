import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${user["cardCode"]} "),
        ),
        body: userDetails());
  }

  userDetails() {
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("${user["cardName"]} ",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("${user["email"]} "),
            leading: Icon(Icons.person, color: Colors.blue),
          ),
          ListTile(
            title: Text("${user["logradouro"]} " "${user["numero"]} ",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("${user["complemento"]} "),
            leading: Icon(Icons.map, color: Colors.blue),
          ),
          ListTile(
            title: Text("${user["telefone1"]} ",
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("${user["telefone2"]} "),
            leading: Icon(Icons.settings_cell, color: Colors.blue),
          ),
          ListTile(
            title: Text("${user["cnpjCpf"]} ",
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(Icons.credit_card, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
