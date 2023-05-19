//TODO : repo 1 :  GET api test :  getName
import 'package:dio/dio.dart';

void getNameAPI() async{
  final dio = Dio();
  final response = await dio.get("https://localhost:7167/api/Users/GetName/");
  print(response);
  print("shady");
}

//TODO : repo 1 :  POST api test :  SendGetName

//TODO : repo 1 :  POST api test :  getOTPCode


//TODO : repo 1 :  POST api test :  SaveUserInfo


