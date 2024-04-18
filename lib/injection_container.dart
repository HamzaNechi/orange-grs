import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/features/auth/data/datasources/remote_datasource_auth.dart';
import 'package:orange_grs/features/auth/data/repositorie/auth_repository_impl.dart';
import 'package:orange_grs/features/auth/domain/repositorie/auth_repository.dart';
import 'package:orange_grs/features/auth/domain/usecases/signin_use_case.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/sites/data/datasources/remote_data_source.dart';
import 'package:orange_grs/features/sites/data/repositories/site_repository_impl.dart';
import 'package:orange_grs/features/sites/domain/repositorie/site_repository.dart';
import 'package:orange_grs/features/sites/domain/usecases/get-all_facture.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_all_site.dart';
import 'package:orange_grs/features/sites/domain/usecases/get_nombre_facture_reel.dart';
import 'package:orange_grs/features/sites/domain/usecases/serach_site_usecas.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/data/datasources/visite_remote_datasource.dart';
import 'package:orange_grs/features/visites/data/repositories/visite_repository_impl.dart';
import 'package:orange_grs/features/visites/domain/repositories/visite_repository.dart';
import 'package:orange_grs/features/visites/domain/usecases/add_new_visite_use_case.dart';
import 'package:orange_grs/features/visites/domain/usecases/get_all_visite_use_case.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
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
  sl.registerFactory(() => SiteBloc(getAllSites: sl(), searchSiteByCode: sl(), getNombreFactureReel: sl()));
  sl.registerFactory(() => FactureSiteBloc(getAllFacturesSites: sl()));
// Use case
  sl.registerLazySingleton(() => GetAllSites(sl()));
  sl.registerLazySingleton(() => SearchSiteUseCase(sl()));
  sl.registerLazySingleton(() => GetAllFacturesSitesUseCase(sl()));
  sl.registerLazySingleton(() => GetNombreFactureReel(sl()));
// Repository
  sl.registerLazySingleton<SiteRepository>(() => SiteRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
//DataSource
  sl.registerLazySingleton<SiteRemoteDataSource>(() => SiteRemoteDataSourceImpl());
//! ------------------------------ End Features - sites




//! ------------------------------ Features - visites
// Bloc
  sl.registerFactory(() => VisiteBloc(getAllVisiteUseCase: sl(),addNewVisiteUseCase: sl()));
// use case
  sl.registerLazySingleton(() => GetAllVisiteUseCase(sl()));
  sl.registerLazySingleton(() => AddNewVisiteUseCase(sl()));
// Repository
  sl.registerLazySingleton<VisiteRepository>(() => VisiteRepositoryImpl(visiteRemoteDataSource: sl(), networkInfo: sl()));
//DataSource
  sl.registerLazySingleton<VisiteRemoteDataSource>(() => VisiteRemoteDataSourceImpl());
//! ------------------------------ End Features - visites




//!-----------------------------------Features - Auth
// bloc
  sl.registerFactory(() => LoginBlocBloc(signInUseCase: sl()));
// use case
  sl.registerLazySingleton(() => SignInUseCase(sl()));
// repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()) );
// datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
//! ------------------------------ End Features - Auth








//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}