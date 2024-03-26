import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/app_theme.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/widgets/splash_screen.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './injection_container.dart' as di;



late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<BottomNavBloc>()..add(const BottomNavOnChangeEvent(index: 0)),),
        BlocProvider(create: (context) => di.sl<SiteBloc>()..add(GetAllSiteEvent()),),
        BlocProvider(create: (context) => di.sl<FactureSiteBloc>()),
        BlocProvider(create: (context) => di.sl<LoginBlocBloc>(),)
      ],
      child: MaterialApp(
        title: 'GRS-Orange',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),          
      ),
    );
  }
}

