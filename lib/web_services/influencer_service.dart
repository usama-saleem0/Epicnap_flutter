import 'dart:convert';

import 'package:first_project/model/user_model.dart';
import 'package:first_project/web_services/web_service_url.dart';

import '../model/response_model.dart';
import 'http_clients.dart';


class InfluncerServices{

  InfluncerServices._internalPrivateConstructor();

  static final InfluncerServices _instance = InfluncerServices._internalPrivateConstructor();

  factory InfluncerServices(){
    return _instance;
  }

  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  Future<String> registerUser({required String email,required String password,required String name , required String confirm , required String country , required String user})async{
    Map<String, dynamic> requestBody={
      "email" : email,
      "password" : password,
      "confirm" : confirm,
      "name" : name,
      "country" : country,
      "user":user
    };
    print('-------------------$requestBody');
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: registerUrl,requestBody: requestBody,isTokenRequired: false);
    print('-------------------${responseModel.statusDescription}');
    if(responseModel.statusDescription=="Registration successful"){
      return responseModel.statusDescription;
    }else{
      return responseModel.statusDescription;
    }
  }


  Future<UserModel> loginUser({required String email,required String password})async{
    Map<String, dynamic> requestBody={
      "email" : email,
      "password" : password,

    };
    UserModel userModel=UserModel.empty();
    ResponseModel responseModel = await _httpRequestClient.postRequest(url: loginUrl,requestBody: requestBody,isTokenRequired: false);
    if(responseModel.statusDescription=="successful"){
      userModel=UserModel.fromJson(responseModel.data, responseModel.statusDescription);
      return userModel;
    }else{
      userModel.message=responseModel.statusDescription;
      return userModel;
    }
  }

}