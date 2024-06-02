
//const String BASE_URL_PUBLIC= "https://egrsserver.onrender.com/egrs";
import 'package:orange_grs/main.dart';

final String? adressIP = sharedPref.getString("ip");
const  String BASE_URL_PUBLIC = 'http://192.168.1.19:8089/egrs';
const  String BASE_URL_ADMIN = '$BASE_URL_PUBLIC/admin';
const String BASE_URL_TECH = '$BASE_URL_PUBLIC/tech';
const String BASE_URL_TECH_ADMIN = '$BASE_URL_PUBLIC/egrs/techadmin';