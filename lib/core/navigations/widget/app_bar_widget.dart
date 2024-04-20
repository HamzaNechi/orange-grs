import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:orange_grs/core/navigations/bottom_nav/bloc/bottom_nav_event.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/logo.png")),
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
            centerTitle: false,

            actions: [


              
              
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(CupertinoIcons.question_circle, color: secondaryColor, size: 25,),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<BottomNavBloc>(context).add(const ShowProfileEvent(showProfile: true));
                  },
                  child: const CircleAvatar(
                    
                    backgroundColor: greyColor,
                    radius: 20,
                    child: Icon(CupertinoIcons.person_fill, color: whiteColor,size: 30,),
                  ),
                ),
              ),
            ],
          );
  }
  
  

}