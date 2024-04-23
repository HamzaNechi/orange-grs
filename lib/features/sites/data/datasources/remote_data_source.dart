import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orange_grs/core/errors/exceptions.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/features/sites/data/model/facture_model.dart';
import 'package:orange_grs/features/sites/data/model/site_model.dart';
import 'package:orange_grs/main.dart';


abstract class SiteRemoteDataSource{
  Future<List<SiteModel>> getAllSites(String? code);
  Future<List<FactureSiteModel>> getAllFactureSites(int siteId);
  Future<Map<String, dynamic>> getNombreFactureReelEn6Mois(int siteId);
}


class SiteRemoteDataSourceImpl implements SiteRemoteDataSource{


  @override
  Future<List<SiteModel>> getAllSites(String? code) async {
    final uri = code == null ? Uri.parse("$BASE_URL_PUBLIC/sites") : Uri.parse("$BASE_URL_PUBLIC/sites/$code");
    try{
      final response = await http.get(
        uri,
        headers: {
          "Content-Type" : "application/json",
          "Authorization": "Bearer ${sharedPref.getString('token')}",
          }
        ).timeout(const Duration(seconds: 10));


      if(response.statusCode == 200){
        List decodeJsonData = jsonDecode(response.body) as List;
        List<SiteModel> sites = decodeJsonData
                                .map<SiteModel>((siteModel) => SiteModel.fromJson(siteModel))
                                .toList();
        return sites;
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
  Future<List<FactureSiteModel>> getAllFactureSites(int siteId) async {
    final uri = Uri.parse("$BASE_URL_PUBLIC/invoices/$siteId");

    try{
      final response = await http.get(
        uri,
        headers: {
          "Content-Type" : "application/json",
          "Authorization": "Bearer ${sharedPref.getString('token')}",
          }
        ).timeout(const Duration(seconds: 10));

      if(response.statusCode == 200){
        List decodeJsonData = jsonDecode(response.body) as List;
        List<FactureSiteModel> factures = decodeJsonData
                                .map<FactureSiteModel>((facture) => FactureSiteModel.fromJson(facture))
                                .toList();
        return factures;
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
  Future<Map<String, dynamic>> getNombreFactureReelEn6Mois(int siteId) async {
    final uri = Uri.parse("$BASE_URL_PUBLIC/invoices/type/$siteId");

    try{
      final response = await http.get(
        uri,
        headers: {
          "Content-Type" : "application/json",
          "Authorization": "Bearer ${sharedPref.getString('token')}",
          }
        ).timeout(const Duration(seconds: 20));


      if(response.statusCode == 200){
        Map<String, dynamic> decodeJsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return decodeJsonData;
      }else if(response.statusCode == 401){
        throw ExpiredJwtException();
      }else{
          throw ServerException();
      }

    }on TimeoutException{
      throw TimeoutException("Le serveur est actuellement en panne");
    }on Exception{
      throw("Le serveur est actuellement en panne");
    }
  }

}