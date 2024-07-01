import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_state.dart';
import 'package:orange_grs/core/navigations/widget/app_bar_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orange_grs/core/widgets/body_scaffold_global.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/auth/presentation/pages/profile_user_page.dart';
import 'package:orange_grs/features/sites/presentation/pages/site_liste_page.dart';
import 'package:orange_grs/features/visites/presentation/pages/list_visite.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    BlocProvider.of<LoginBlocBloc>(context).add(GetConnectedUserEvent());
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    double radiusValue = 0;
    BodyScaffoldGlobal? bodyIndex = BodyScaffoldGlobal.of(context);
    List<Widget> widgets = [const SiteListPage(), const ListVisite()];
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<BottomNavBloc, BottomNavState>(
      listener: (context, state) {
        if (state is ShowProfileState) {
          if (state.showProfileAnswer) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        }
      },
      builder: (context, state) {
        double translateWidth = 0;
        double scaleValue = 1;

        return Stack(
          children: [

            const AnimatedPositioned(
              duration: Duration(microseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: ProfileUserPage(), 
            ),



            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                translateWidth = screenWidth * 0.8 * (1 - animationController.value);
                scaleValue = 0.8 + 0.2 * animationController.value;
                radiusValue = 24 * (1- animationController.value);
                return Transform.translate(
                  offset: Offset(translateWidth, 0),
                  child: Transform.scale(
                    scale: scaleValue,
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radiusValue),
                      child: Scaffold(
                        resizeToAvoidBottomInset: false,
                        appBar: const AppBarWidget(),
                        body: widgets[bodyIndex!.indexScaffold],
                        bottomNavigationBar: Container(
                          decoration: BoxDecoration(
                            color: greyBottomNav,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black.withOpacity(.1),
                              )
                            ],
                          ),
                          child: SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15, vertical: 10),
                              child: GNav(
                                rippleColor: Colors.grey[300]!,
                                hoverColor: Colors.grey[100]!,
                                gap: 8,
                                activeColor: primaryColor,
                                iconSize: 24,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                duration: const Duration(milliseconds: 400),
                                tabBackgroundColor: greySurBackColor,
                                color: secondaryColor,
                                tabs: const [
                                  GButton(
                                    icon: Icons.home_work_outlined,
                                    text: 'Sites',
                                  ),
                                  GButton(
                                    icon: CupertinoIcons.square_favorites,
                                    text: 'Visites',
                                  ),
                                ],
                                selectedIndex: bodyIndex.indexScaffold , //selectedIndex,
                                onTabChange: (index) {
                                  setState(() {
                                    bodyIndex.indexScaffold = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

