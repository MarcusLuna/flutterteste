import 'package:flutter/material.dart';
import 'package:gif/pages/login.pages.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

void main() => runApp(MyApp());



class MyApp  extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp (
        title: "Login",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),

      ),
    );
  }

}