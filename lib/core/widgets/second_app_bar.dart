import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';

class SecondAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final BuildContext contextX;
  final String? title;
  const SecondAppBarWidget({super.key, required this.contextX, this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
            leading: IconButton(onPressed: () {
              if(contextX.widget.toString() == "SiteDetailPage"){
                BlocProvider.of<SiteBloc>(context).add(GetAllSiteEvent());
              }
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.keyboard_backspace_outlined, color: secondaryColor, size: 30,)),
            title: title != null ? Text(title!, style: const TextStyle(
                fontSize: 17,
                fontFamily: rubikFontSemiBold,
                fontWeight: FontWeight.w500
              ),) : null,
            centerTitle: true,
            actions: [


              
              
              title == null ? const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(CupertinoIcons.question_circle, color: secondaryColor, size: 25,),
              ) : const SizedBox(),


              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: CircleAvatar(
                  
                  backgroundColor: greyColor,
                  radius: 20,
                  child: Icon(CupertinoIcons.person_fill, color: whiteColor,size: 30,),
                ),
              ),
            ],
          );
  }
  
  

}