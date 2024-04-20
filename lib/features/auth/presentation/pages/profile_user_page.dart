import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:orange_grs/core/strings/fonts.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: purpleColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding:  const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
        
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                BlocProvider.of<BottomNavBloc>(context).add(const ShowProfileEvent(showProfile: false));
                              },
                              child: const SizedBox(
                                height: 45,
                                width: 45,
                                child: Card(
                                  elevation: 1,
                                  color: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
                                  child: Center(child: Icon(Icons.close, color: whiteColor,)),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10,),

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
              
        
                        const SizedBox(height: 30,),



                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                backgroundColor: greyColor,
                                child: Center(child: Icon(Icons.person, size: 50, color: whiteColor,)),
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(height: 30,),
        
                        const Text(
                              "Mes informations :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w600,
                                  color: secondaryColor),
                            ),
        
                        const SizedBox(height: 20,),
        
        
                        
                        const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                              "hamzaN",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),
                            ),
        
                          leading: Icon(Icons.card_membership, color: secondaryColor, size: 30,),
                        ),
        
        
                        const SizedBox(height: 5,),
        
        
        
                        const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                              "hamzanechi@gmail.com",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),
                            ),
        
                          leading: Icon(Icons.email_outlined, color: secondaryColor, size: 30,),
                        ),
                        
        
                        const SizedBox(height: 5,),
                        const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                              "hamza nechi",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),
                            ),
        
                          leading: Icon(Icons.person_2_outlined, color: secondaryColor, size: 30,),
                        ),
        
        
                        
        
        
        
                        const SizedBox(height: 5,),
                        const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                              "Administrateur",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),
                            ),
        
                          leading: Icon(Icons.security_outlined, color: secondaryColor, size: 30,),
                        ),
        
                        const SizedBox(height: 5,),
                        const ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          title: Text(
                              "hargé d'opération déploiement Génie Civil",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),
                            ),
        
                          leading: Icon(Icons.security_update_good_outlined, color: secondaryColor, size: 30,),
                        ),
        
        
                        const SizedBox(height: 70,),
        
        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: secondaryColor,
                                width: 2
                              ),
                            ),
        
                            child: const Center(
                              child: Text("Déconnexion", style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: rubikFontMedium,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor),),
                            ),
                          ),
                        )
        
        
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}