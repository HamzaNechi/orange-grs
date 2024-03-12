import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';


final appTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: greyColor, background: whiteColor),
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                  color: secondaryColor, // Couleur du texte des étiquettes sélectionnées
                  fontSize: 12,
                  fontFamily: 'Rubik-Medium',
                  fontWeight: FontWeight.w600
                );
              } else {
                return const TextStyle(
                  color: secondaryColor, // Couleur du texte des étiquettes non sélectionnées avec opacité
                  fontSize: 12,
                  fontFamily: 'Rubik-Medium',
                  fontWeight: FontWeight.w600
                );
              }
            },
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: whiteColor,
          scrolledUnderElevation: 0
        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(top: 12),
          filled: true,
          fillColor: whiteColor,
          hintStyle: const TextStyle(
            color: greyForTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),


          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: primaryColor, 
              width: 1
              ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: greyColor, 
              width: 1
              ),
          ),
        )
      );