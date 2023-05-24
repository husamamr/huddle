//TODO : repo 1 :  GET api test :  getName
import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';

Future<String> getNameAPI() async{
  final dio = Dio();
  final response = await dio.get("https://localhost:7167/api/Users/GetName/");
  String name = response.data.toString();
  return name;
}

//TODO : repo 1 :  POST api test :  SendGetName
Future<String> postNameAPI() async{
  final dio = Dio();
  String mail = "https://localhost:7167/api/Users/AuthenticateUser";
  var name = "husamamr6@gmail.com";
  final response = await dio.post(mail,options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
  data: jsonEncode(name),);
  return response.data.toString();
}

//TODO : repo 1 :  POST api test :  getOTPCode


//TODO : repo 1 :  POST api test :  SaveUserInfo


