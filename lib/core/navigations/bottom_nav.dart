import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_state.dart';
import 'package:orange_grs/core/navigations/widget/app_bar_widget.dart';


import 'package:google_nav_bar/google_nav_bar.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(builder: (context, state) {
        //final String titleAppBar = state.props[0].toString();
        final Widget widget = state.props[2] as Widget;
        int selectedIndex = state.props[1] as int;

        return Scaffold(
          resizeToAvoidBottomInset : false,
          
          appBar: const AppBarWidget(),

          body: widget,

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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                          icon: Icons.widgets_outlined,
                          text: 'Accueil',
                        ),
                        GButton(
                          icon: Icons.home_work_outlined,
                          text: 'Sites',
                        ),
                        GButton(
                          icon: CupertinoIcons.square_favorites,
                          text: 'Visites',
                        ),
                      ],
                      selectedIndex: selectedIndex,
                      onTabChange: (index) {
                        BlocProvider.of<BottomNavBloc>(context).add(BottomNavOnChangeEvent(index: index));
                      },
                    ),
                  ),
                ),
            ),
        );
    },);
  }
}


