import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.6.30:8086/api/5/ClienteSAP";

class API {
  static Future getUsers() async {
    return await http.get(baseUrl);
  }
}