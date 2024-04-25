import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/urls.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    const SizedBox(height: 30,),
                
                    // InteractiveViewer(
                    //   panEnabled: false,
                    //   boundaryMargin: const EdgeInsets.all(100),
                    //   minScale: 0.5,
                    //   maxScale: 2,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: MediaQuery.of(context).size.height *0.23,
                    //     decoration: BoxDecoration(
                    //       color: secondaryColor,
                    //       borderRadius: BorderRadius.circular(20),
                    //       image:DecorationImage(
                    //         image: NetworkImage("$BASE_URL_PUBLIC/api/images/${visite.photoCompteur}"), 
                    //         fit: BoxFit.fill)
                    //     ),
                    //   ),
                    // ),


                     Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *0.23,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InteractiveViewer(
                            minScale: 1,
                            maxScale: 5,
                            child: Image.network("$BASE_URL_PUBLIC/api/images/${visite.photoCompteur}", fit: BoxFit.contain,)
                            ),
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


                    visite.site.isSharing == 1 ? Column(
                      children: [
                        const SizedBox(height: 10,),
                
                
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ampérage OTN", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                              Text("${visite.otn} A", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                            ],
                          ),
                        ),


                        const SizedBox(height: 10,),
                
                
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ampérage OO", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                              visite.oo > 0 ? Text(
                                "${visite.oo} A", 
                                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 14, 
                                  color: greyForTextColor),) : Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  decoration:
                                                                      const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                                                ),
                            ],
                          ),
                        ),



                        const SizedBox(height: 10,),
                
                
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ampérage TT", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),),
                              visite.tt > 0 ? Text(
                                "${visite.tt} A", 
                                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 14, 
                                  color: greyForTextColor),) : Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  decoration:
                                                                      const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30,),
                      ],
                    ) : const SizedBox(height: 30,),
                
                
                    //const SizedBox(height: 30,),
                    Text("Commentaire", 
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: greyForTextColor),),
                
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              GlobalFunctionUtils.normalizeString(visite.commentaire), 
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: secondaryColor),)),
                          //Text("Hamza nechi 52 907 678", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: greyForTextColor),),
                        ],
                      ),
                    ),
                
                
                  ],
                ),
              ),
            )
    );
  }
}