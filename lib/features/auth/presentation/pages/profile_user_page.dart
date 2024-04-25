import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final spaceButtonLogoutHeight = MediaQuery.of(context).size.height > 700 ? screenHeight * 0.062: screenHeight * 0.05 ;
    return Material(
      child: BlocConsumer<LoginBlocBloc, LoginState>(
        listener: (context, state) {
          if(state is ExpiredJwtState){
            sharedPref.setString('token', '');
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(
                builder: (context) => const LoginPage(),), 
              (route) => false);
          }
        },
        builder: (context, state) {
          if(state is GetConnectedUserState){
            final User user = state.user;
            return Container(
                    color: purpleColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.08,
                                ),

                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        BlocProvider.of<BottomNavBloc>(context).add(
                                            const ShowProfileEvent(showProfile: false));
                                      },
                                      child: SizedBox(
                                        height: screenHeight * 0.056,
                                        width: screenHeight * 0.056,
                                        child: const Card(
                                          elevation: 1,
                                          color: secondaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: Center(
                                              child: Icon(
                                            Icons.close,
                                            color: whiteColor,
                                          )),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: rubikFontMedium,
                                          fontWeight: FontWeight.w600,
                                          color: secondaryColor),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: screenHeight * 0.037,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.124,
                                      width: screenHeight * 0.124,
                                      child: const CircleAvatar(
                                        backgroundColor: greyColor,
                                        child: Center(
                                            child: Icon(
                                          Icons.person,
                                          size: 50,
                                          color: whiteColor,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: screenHeight * 0.037,
                                ),

                                const Text(
                                  "Mes informations :",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: rubikFontMedium,
                                      fontWeight: FontWeight.w600,
                                      color: secondaryColor),
                                ),

                                SizedBox(
                                  height: screenHeight * 0.024,
                                ),

                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  title: Text(
                                    user.login,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: rubikFontMedium,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColor),
                                  ),
                                  leading: const Icon(
                                    Icons.card_membership,
                                    color: secondaryColor,
                                    size: 30,
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),

                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  title: Text(
                                    user.email,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: rubikFontMedium,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColor),
                                  ),
                                  leading: const Icon(
                                    Icons.email_outlined,
                                    color: secondaryColor,
                                    size: 30,
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  title: Text(
                                    "${user.firstName} ${user.lastName}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: rubikFontMedium,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColor),
                                  ),
                                  leading: const Icon(
                                    Icons.person_2_outlined,
                                    color: secondaryColor,
                                    size: 30,
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  title: Text(
                                    user.role,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: rubikFontMedium,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColor),
                                  ),
                                  leading: const Icon(
                                    Icons.security_outlined,
                                    color: secondaryColor,
                                    size: 30,
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  title: Text(
                                    user.function,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: rubikFontMedium,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColor),
                                  ),
                                  leading: const Icon(
                                    Icons.security_update_good_outlined,
                                    color: secondaryColor,
                                    size: 30,
                                  ),
                                ),

                                SizedBox(
                                  height: spaceButtonLogoutHeight,
                                ), //50px

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      sharedPref.remove('token');
                                      sharedPref.remove('isAdmin');
                                      Navigator.pushAndRemoveUntil(
                                        context, MaterialPageRoute(builder: (context) => const LoginPage(),), 
                                        (route) => false);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(7),
                                        border:
                                            Border.all(color: secondaryColor, width: 2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Déconnexion",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: rubikFontMedium,
                                              fontWeight: FontWeight.w400,
                                              color: secondaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }else if(state is ErrorProfileState){
            return Container(
              color: Colors.red,
            );
          }else if (state is LoadingLoginState){
            return Container(
              color: Colors.blue,
            );
          }else{
            return Container(
              color: Colors.amber,
            );
          }
          
        },
      ),
    );
  }
}
