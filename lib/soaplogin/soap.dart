import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';

class teste3 {

  static Future<bool> login(String email, String password) async {
    final Xml2Json xml2json = new Xml2Json();
    var envelope = '<?xml version="1.0" encoding="utf-8"?>' +
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
        '<soap:Body>' +
        '<Login xmlns="http://tempuri.org/">' +
        '<Email>$email</Email>' +
        '<Password>$password</Password>' +
        '</Login>' +
        '</soap:Body>' +
        '</soap:Envelope>';

    var response =
        await http.post('http://192.168.6.30:369/IntegraSAP.asmx?op=Login',
            headers: {
              "Content-Type": "text/xml; charset=utf-8",
              "SOAPAction": "http://tempuri.org/Login",
              "Host": "192.168.6.30"
              //"Accept": "text/xml"
            },
            body: envelope);

    print('Response status: ${response.statusCode}');

    print(response.body);
    Xml2Json xml2 = new Xml2Json();
    xml2.parse(response.body);
    Map jsonteste =  json.decode(xml2.toGData());
    var result = jsonteste["soap\$Envelope"]["soap\$Body"]["LoginResponse"]["LoginResult"]["Data"]["ResultCode"]["\$t"]   ;
    var mensagem = jsonteste["soap\$Envelope"]["soap\$Body"]["LoginResponse"]["LoginResult"]["Data"]["ResultMessage"]["\$t"]   ;

    print(result);
    print(mensagem);



//    var tes = xml2json.toGData();
//    var tes2 = json.decode(tes);
//
//    print(tes2);
//    print(tes2['ResultCode']);
//
//    var rawXmlResponse = response.body;
//    xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
//    print('aaaaaa' + rawXmlResponse);

    if (result == 0) {
      return true;
    } else {
      return false;
    }
  }
}
