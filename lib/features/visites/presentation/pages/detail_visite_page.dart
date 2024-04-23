import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
//import 'package:orange_grs/main.dart';

class DetailVisitePage extends StatelessWidget {
  final Visite visite;
  const DetailVisitePage({super.key, required this.visite});

  @override
  Widget build(BuildContext context) {

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(visite.dateInsertion!);
    //bool isAdmin = sharedPref.getBool('isAdmin')!;
    return Scaffold(
      appBar: SecondAppBarWidget(contextX: context),
      body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *0.23,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                      image:DecorationImage(
                        image: NetworkImage("$BASE_URL_PUBLIC/api/images/${visite.photoCompteur}"), 
                        fit: BoxFit.fill)
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text("Visite", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: greyForTextColor),),

                  const SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Index", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                        Text("${visite.indexCompteur}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                      ],
                    ),
                  ),


                  const SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date d'insertion", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                        Text(formattedDate, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                      ],
                    ),
                  ),




                  const SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Site", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                        Text(visite.site.siteCode!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                      ],
                    ),
                  ),





                  const SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Responsable", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                        Text("${visite.responsable}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                      ],
                    ),
                  ),


                  const SizedBox(height: 30,),
                  Text("Commentaire", 
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: greyForTextColor),),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Les formes anciennes du Moyen Âge désignent au xiie siècle le volume qui contient le texte sacré des Évangiles, puis au xiiie siècle, le texte original d'un livre saint ou des propos de quelqu'un. Au xviie siècle le mot s’applique au passage d'un ouvrage pris comme référence et au début du xixe siècle le mot texte a son sens général d'« écrit »", 
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),)),
                        //Text("Hamza nechi", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                      ],
                    ),
                  ),


                ],
              ),
            )
    );
  }
}