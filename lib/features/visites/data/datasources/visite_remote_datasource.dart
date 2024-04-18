import 'dart:async';
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/features/visites/data/model/visite_model.dart';
import 'package:http/http.dart' as http;
import 'package:orange_grs/main.dart';



abstract class VisiteRemoteDataSource{
  Future<List<VisiteModel>> getAllVisites();
  Future<bool> addNewVisite(VisiteModel visiteModel, XFile file);
}


class VisiteRemoteDataSourceImpl extends VisiteRemoteDataSource{



  @override
  Future<List<VisiteModel>> getAllVisites() async{
    const url = "$BASE_URL_PUBLIC/visites";
    try{
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type" : "application/json",
          "Authorization": "Bearer ${sharedPref.getString('token')}",
          }
        ).timeout(const Duration(seconds: 10));
        if(response.statusCode == 200){
          List decodeJsonData = jsonDecode(response.body) as List;
          List<VisiteModel> visites = decodeJsonData.map((visite) => VisiteModel.fromJson(visite)).toList();
          return visites;
        }else if(response.statusCode == 401){
          throw ExpiredJwtException();
        }else{
          throw ServerException();
        }
    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }
  
  @override
  Future<bool> addNewVisite(VisiteModel visiteModel, XFile file) async{
    
    const url = "$BASE_URL_PUBLIC/visites";

    try{

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      request.fields['indexCompteur'] = visiteModel.indexCompteur.toString();
      request.fields['commentaire'] = visiteModel.commentaire;
      request.fields['siteId'] = visiteModel.site.siteId.toString();
      request.headers['Authorization'] = 'Bearer ${sharedPref.getString('token')}';
      request.files.add(
        await http.MultipartFile.fromPath('photo', file.path),
      );

      final response = await request.send().timeout(const Duration(seconds: 10));
      if(response.statusCode == 200){
        return true;
      }else if(response.statusCode == 401){
          throw ExpiredJwtException();
      }else{
          throw ServerException();
      }

    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }

}