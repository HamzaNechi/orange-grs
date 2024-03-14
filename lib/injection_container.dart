import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/features/sites/data/datasources/remote_data_source.dart';
import 'package:orange_grs/features/sites/data/repositories/site_repository_impl.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_all_site.dart';
import 'package:orange_grs/features/sites/domain/usecases/serach_site_usecas.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc/site_bloc.dart';

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features -------------------- bottom nav

// Bloc
  //bottom nav bar
  sl.registerFactory(() => BottomNavBloc());


//! ------------------------------ Features - sites
// Bloc
  sl.registerFactory(() => SiteBloc(getAllSites: sl(), searchSiteByCode: sl()));
// Use case
  sl.registerLazySingleton(() => GetAllSites(sl()));
  sl.registerLazySingleton(() => SearchSiteUseCase(sl()));
// Repository
  sl.registerLazySingleton<SiteRepository>(() => SiteRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
//DataSource
  sl.registerLazySingleton<SiteRemoteDataSource>(() => SiteRemoteDataSourceImpl());


//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}