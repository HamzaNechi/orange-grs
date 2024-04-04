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
import 'package:flutter_localizations/flutter_localizations.dart';
import './injection_container.dart' as di;



late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  await di.init();
  Locale _locale = const Locale('fr','FR');
  runApp(MyApp(locale: _locale,));
}

class MyApp extends StatelessWidget {
  final Locale locale;
  const MyApp({super.key, required this.locale});

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
        locale: locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales:const [
          Locale('en'), // Anglais
          Locale('fr'), // Français
        ],
        home: const SplashScreen(),          
      ),
    );
  }
}

