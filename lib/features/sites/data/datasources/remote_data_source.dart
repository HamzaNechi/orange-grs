import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/features/sites/data/model/site_model.dart';


abstract class SiteRemoteDataSource{
  Future<List<SiteModel>> getAllSites(String? code);
}


class SiteRemoteDataSourceImpl implements SiteRemoteDataSource{


  @override
  Future<List<SiteModel>> getAllSites(String? code) async {
    final uri = code == null ? Uri.parse("$BASE_URL/sites") : Uri.parse("$BASE_URL/sites/$code");
    try{
      final response = await http.get(
        uri,
        headers: {"Content-Type" : "application/json"}
        ).timeout(const Duration(seconds: 10));


      if(response.statusCode == 200){
        List decodeJsonData = jsonDecode(response.body) as List;
        List<SiteModel> sites = decodeJsonData
                                .map<SiteModel>((siteModel) => SiteModel.fromJson(siteModel))
                                .toList();
        return sites;
        }else{
          throw ServerException();
      }

    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }
  }

}