import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/app_theme.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/widgets/splash_screen.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc/site_bloc.dart';
import './injection_container.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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

