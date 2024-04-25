import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/facture_site.dart';

class ItemFactureSite extends StatelessWidget {
  final FactureSite facture;
  final BoxConstraints constraints;
  const ItemFactureSite({super.key, required this.constraints, required this.facture});

  @override
  Widget build(BuildContext context) {
    final parentWidth = constraints.maxWidth;
    final parentHeight = constraints.maxHeight;
    final boxHeight = MediaQuery.of(context).size.height > 700 ? parentHeight * 0.38 : parentHeight *0.44 ;


    double convertEnTnd(double montant){
      return montant/1000;
    }



    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: parentWidth * 0.95,
          height: boxHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: greySurBackColor,
              width: 1
            )
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (parentHeight * 0.015)*2, vertical: parentHeight * 0.015),
            child: Column(
              children: [

                _buildLineInfo('Type', facture.itemType.toString(),context),

                _buildLineInfo('Mois', getMonth(facture.month),context),


                _buildLineInfo('Année', facture.year.toString(),context),


                _buildLineInfo('Consommation', "${facture.consommationKwh} Kwh",context),


                _buildLineInfo('Montant', "${convertEnTnd(facture.montantConsommation!)} TND",context),


                _buildLineInfo('Crédit', "${convertEnTnd(facture.credit!)} TND",context),

                _buildLineInfo('Tva', "${convertEnTnd(facture.tva!)} TND",context),



                SizedBox(height: parentHeight * 0.015,),


                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(color: greySurBackColor,height: 2,)),

                SizedBox(height: parentHeight * 0.015,),
                
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${convertEnTnd(facture.finalSolde)} TND", style: TextStyle(
                          color: primaryColor.withOpacity(0.8), 
                          fontWeight: FontWeight.w600, 
                          fontFamily: rubikFontSemiBold,
                          fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            ),
        ),
      ],
    );
  }


  String getMonth(int month){
    switch(month){
      case 1 : return 'Janvier';
      case 2 : return 'Février';
      case 3 : return 'Mars';
      case 4 : return 'Avril';
      case 5 : return 'Mai';
      case 6 : return 'Juin';
      case 7 : return 'Juillet';
      case 8 : return 'Août';
      case 9 : return 'Septembre';
      case 10 : return 'Octobre';
      case 11 : return 'Novembre';
      case 12 : return 'Décembre';
      default : return '';
    }
  }



  Widget _buildLineInfo(String title, String info, BuildContext context){
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),),

                    Text(info, 
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400, 
                      fontSize: 14, color: greyForTextColor),),
                  ],
                );
  }
}