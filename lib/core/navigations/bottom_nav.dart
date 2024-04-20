import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_state.dart';
import 'package:orange_grs/core/navigations/widget/app_bar_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orange_grs/features/auth/presentation/pages/profile_user_page.dart';


// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool showProfilePage = false;
//     double translateWidth = 0;
//     double scaleValue = 1;
//     double radiusValue = 0;
//     Widget widget = Container();
//     int selectedIndex = 0;

    
//     return BlocConsumer<BottomNavBloc, BottomNavState>(
//       listener: (context, state) {
//         if(state is BottomNavSiteWidgetState){
//           BlocProvider.of<SiteBloc>(context).add(GetAllSiteEvent());
//         }else if(state is BottomNavVisiteWidgetState){
//           BlocProvider.of<VisiteBloc>(context).add(GettAllVisitesEvent());
//         }else if(state is ShowProfileState){
//           if(showProfilePage != state.showProfileAnswer){
//             showProfilePage = state.showProfileAnswer;
//           }

//           if(showProfilePage){
//             translateWidth  = MediaQuery.of(context).size.width * 0.8;
//             scaleValue = 0.8;
//             radiusValue = 24;
//           }else{
//             translateWidth  = 0;
//             scaleValue = 1;
//             radiusValue = 0;
//           }
//         }
//       },
//       builder: (context, state) {

        

//         if(state is BottomNavHomeWidgetState){
//           widget = state.page;
//           selectedIndex = state.index;
//         }else if(state is BottomNavSiteWidgetState){
//           widget = state.page;
//           selectedIndex = state.index;
//         }else if(state is BottomNavVisiteWidgetState){
//           widget = state.page;
//           selectedIndex = state.index;
//         }

//         // final Widget widget = state.props[2] as Widget;
//         // int selectedIndex = state.props[1] as int;
        
//         return Stack(
//           children :[ 

//             AnimatedPositioned(
//               onEnd: () {
//                 print("end animation");
//               },
//               duration: const Duration(microseconds: 200),
//               curve: Curves.fastOutSlowIn,
//               child: const ProfileUserPage(), 
//             ),

            
            
//             Transform.translate(
//               offset: Offset(translateWidth, 0),
//               child: Transform.scale(
//                 scale: scaleValue,
//                 alignment: Alignment.centerLeft,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(radiusValue),
//                   child: Scaffold(
//                   resizeToAvoidBottomInset : false,
                  
//                   appBar: const AppBarWidget(),
                            
//                   body: widget,
                            
//                   bottomNavigationBar: Container(
//                         decoration: BoxDecoration(
//                           color: greyBottomNav,
//                           boxShadow: [
//                             BoxShadow(
//                               blurRadius: 20,
//                               color: Colors.black.withOpacity(.1),
//                             )
//                           ],
//                         ),
//                         child: SafeArea(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//                             child: GNav(
//                               rippleColor: Colors.grey[300]!,
//                               hoverColor: Colors.grey[100]!,
//                               gap: 8,
//                               activeColor: primaryColor,
//                               iconSize: 24,
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                               duration: const Duration(milliseconds: 400),
//                               tabBackgroundColor: greySurBackColor,
//                               color: secondaryColor,
//                               tabs: const [
//                                 GButton(
//                                   icon: Icons.widgets_outlined,
//                                   text: 'Accueil',
//                                 ),
//                                 GButton(
//                                   icon: Icons.home_work_outlined,
//                                   text: 'Sites',
//                                 ),
//                                 GButton(
//                                   icon: CupertinoIcons.square_favorites,
//                                   text: 'Visites',
//                                 ),
//                               ],
//                               selectedIndex: selectedIndex,
//                               onTabChange: (index) {
//                                 BlocProvider.of<BottomNavBloc>(context).add(BottomNavOnChangeEvent(index: index));
//                               },
//                             ),
//                           ),
//                         ),
//                     ),
//                             ),
//                 ),
//               ),
//             ),

//           ]
//         );
//     },);
//   }
// }

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double radiusValue = 0;


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
        Widget widget = Container();
        int selectedIndex = 0;

        if (state is BottomNavHomeWidgetState) {
          widget = state.page;
          selectedIndex = state.index;
        } else if (state is BottomNavSiteWidgetState) {
          widget = state.page;
          selectedIndex = state.index;
        } else if (state is BottomNavVisiteWidgetState) {
          widget = state.page;
          selectedIndex = state.index;
        }

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
                translateWidth = MediaQuery.of(context).size.width * 0.8 * (1 - animationController.value);
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

