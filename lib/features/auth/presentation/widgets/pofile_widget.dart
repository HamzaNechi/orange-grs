import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  const ProfileWidget({super.key, required this.user});
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final spaceButtonLogoutHeight = MediaQuery.of(context).size.height > 700 ? screenHeight * 0.062: screenHeight * 0.05 ;
    return Container(
                    color: blueColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                

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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
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

                                

                                SizedBox(
                                  height: spaceButtonLogoutHeight,
                                ),
                                    ],
                                  ),
                                ),
                                 //50px

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
  }
}