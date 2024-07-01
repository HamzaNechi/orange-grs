import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';

class ProfileWidgetWithoutUser extends StatelessWidget {
  const ProfileWidgetWithoutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    color: purpleColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ //50px

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