import 'dart:async';
import 'dart:convert';

import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/features/auth/data/model/login_response_model.dart';
import 'package:orange_grs/features/auth/data/model/user_model.dart';
import 'package:orange_grs/features/auth/domain/entities/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:orange_grs/main.dart';


abstract class AuthRemoteDataSource{
  Future<LoginResponse> doLogin(String login, String password);
  Future<UserModel> getUserConnected();

  Future<UserModel> updateUserPassword(String newPassword);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  @override
  Future<LoginResponse> doLogin(String login, String password) async {
    const uri = "$BASE_URL_PUBLIC/auth/login";

    final _header  = {
      "Content-Type": "application/json",
    };


    final _body =  {
        "login" : login,
        "password" : password
      };
    try{
      var response = await http.post(Uri.parse(uri), body:jsonEncode(_body), headers: _header).timeout(const Duration(seconds: 10));
      print("response login = ${response.body}");
      if(response.statusCode == 200){
        final Map<String, dynamic> mapJson = jsonDecode(response.body) as Map<String, dynamic>;     
        if(mapJson["statusCode"] == 500){
          throw LoginException();
        }else{
          final loginResponse = LoginResponseModel.fromJson(mapJson);
          return loginResponse;
        }
        
      }else{
        throw ServerException();
      }
    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }
  
  @override
  Future<UserModel> getUserConnected() async {
    const uri = "$BASE_URL_PUBLIC/auth/user";

    final header  = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${sharedPref.getString('token')}",
    };


    try{
      var response = await http.get(
        Uri.parse(uri), 
        headers: header).timeout(const Duration(seconds: 10));
      if(response.statusCode == 200){
        final Map<String, dynamic> mapJson = jsonDecode(response.body) as Map<String, dynamic>;   
        final UserModel user = UserModel.fromJson(mapJson);
        return user;
      }else if(response.statusCode == 403){
        throw ExpiredJwtException();
      }else{
        throw ServerException();
      }
    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }

  }
  
  @override
  Future<UserModel> updateUserPassword(String newPassword) async {
    const uri = "$BASE_URL_PUBLIC/users/update/password";

    final header  = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${sharedPref.getString('token')}",
    };

    final body = {
      "password" : newPassword
    };


    try{
      var response = await http.post(
        Uri.parse(uri),
        body: jsonEncode(body),
        headers: header).timeout(const Duration(seconds: 10));
      if(response.statusCode == 200){
        final Map<String, dynamic> mapJson = jsonDecode(response.body) as Map<String, dynamic>;   
        final UserModel user = UserModel.fromJson(mapJson);
        return user;
      }else if(response.statusCode == 403){
        throw ExpiredJwtException();
      }else{
        throw ServerException();
      }
    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }
  

}