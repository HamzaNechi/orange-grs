import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      title: const Text('Confirmation', style: TextStyle(
                  fontSize: 22,
                  fontFamily: rubikFontMedium,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor),),
      content: const Text('Voulez-vous vraiment supprimer cet visite ?', style: TextStyle(
                  fontSize: 18,
                  fontFamily: rubikFontRegular,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Annuler la suppression
            Navigator.of(context).pop(false);
          },
          child: const Text('Annuler',style: TextStyle(
                  fontSize: 18,
                  fontFamily: rubikFontMedium,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor),),
        ),
        TextButton(
          onPressed: () {
            // Confirmer la suppression
            Navigator.of(context).pop(true);
          },
          child: const Text('Supprimer',style: TextStyle(
                  fontSize: 18,
                  fontFamily: rubikFontMedium,
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent),),
        ),
      ],
    );
  }
}

// Utilisation :
void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DeleteConfirmationDialog();
    },
  );
}