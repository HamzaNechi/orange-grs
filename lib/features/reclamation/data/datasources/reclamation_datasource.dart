import 'dart:async';
import 'dart:convert';

import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/features/reclamation/data/models/reclamation_model.dart';
import 'package:http/http.dart' as http;
import 'package:orange_grs/main.dart';


abstract class ReclamationRemoteDataSource{
  Future<ReclamationModel> addReclamation(ReclamationModel reclamationModel);
}

class ReclamationRemoteDataSourceImpl implements ReclamationRemoteDataSource{

 
  @override
  Future<ReclamationModel> addReclamation(ReclamationModel reclamationModel) async {
    const url = "$BASE_URL_PUBLIC/reclamation/";
    Map<String, dynamic> jsonBody = reclamationModel.toJson();

    try{
      final token = sharedPref.getString('token');
      if (token == null) {
        throw ExpiredJwtException();
      }

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ).timeout(const Duration(seconds: 10));

      if(response.statusCode == 200){
        final Map<String, dynamic> jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        ReclamationModel reclamationModel = ReclamationModel.fromJson(jsonData);
        return reclamationModel;
      }else if(response.statusCode == 401){
        throw ExpiredJwtException();
      }else{
        print("response server error reclamation datasource ${response.statusCode}");
        throw ServerException();
      }
    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }

}