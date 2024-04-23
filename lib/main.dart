import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/app_theme.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/utils/image_picker_utils.dart';
import 'package:orange_grs/core/widgets/body_scaffold_global.dart';
import 'package:orange_grs/core/widgets/splash_screen.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './injection_container.dart' as di;



late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  await di.init();
  Locale locale = const Locale('fr','FR');
  runApp(MyApp(locale: locale,));
}

class MyApp extends StatelessWidget {
  final Locale locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BodyScaffoldGlobal(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<BottomNavBloc>()),
          BlocProvider(create: (context) => di.sl<SiteBloc>()..add(GetAllSiteEvent()),),
          BlocProvider(create: (context) => di.sl<VisiteBloc>()..add(GettAllVisitesEvent())),
          BlocProvider(create: (context) => di.sl<FactureSiteBloc>()),
          BlocProvider(create: (context) => di.sl<LoginBlocBloc>(),),
          BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()))
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
      ),
    );
  }
}

