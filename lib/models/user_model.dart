import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
class UserModel  extends Model {

//user now
bool isLoading =false;
 void signUp(){

 }
 void signIn() async{
    isLoading = true;
    notifyListeners();
    
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
 }
 void recoverPass(){

 }
 bool isLoggerdIn(){

 }
}