import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/localisation_site_widget.dart';
import 'package:orange_grs/main.dart';



class SiteDetailWidget extends StatelessWidget {
  final Site site;
  const SiteDetailWidget({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final isSharing = site.isSharing ? 'Site partagé' : 'Site non partagé';

    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.025),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
              child: Container(
                decoration: BoxDecoration(
                    color: greyEtentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Référence", '${site.siteRef}'),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Code", site.siteCode!),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Name", site.siteName!),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Direction", site.direction!),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Type", site.elecType == 1 ? 'BT' : 'MT'),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),


                      BlocConsumer<SiteBloc, SiteState>(
                        builder: (context, state) {
                          if(state is NombreFactureReelEn6MoisState){
                            if("Résilié" != GlobalFunctionUtils.normalizeString(site.status)){
                              if(state.nombre > 0){
                                return Column(
                                  children: [
                                    buildItemDetailBadge(
                                    "Facture réelle", "< 6", 1),

                                    SizedBox(
                                      height: screenHeight * 0.025,
                                    ),


                                    buildItemDetail("District", state.district),
                                  ],
                                );
                              }else{
                                return Column(
                                  children: [
                                    buildItemDetailBadge(
                                    "Facture réelle", "> 6", 0),

                                    SizedBox(
                                      height: screenHeight * 0.025,
                                    ),


                                    buildItemDetail("District", state.district),
                                  ],
                                ); //7amra
                              }
                            }else{
                              return buildItemDetail("District", state.district);
                            }
                          }
                          
                          return Container();
                        }, listener: (BuildContext context, SiteState state) { 
                            if(state is ExpiredTokenState){
                                sharedPref.setString('token','');
                                SnackbarMessage().showErrorSnackBar(context: context, message: EXPIRED_TOKEN_FAILURE_MESSAGE);
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
                            }
                         },
                      ),

                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Status", GlobalFunctionUtils.normalizeString(site.status)),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Configuration", site.configuration!),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail("Estimation consommation",
                          '${site.estimationConsom} Kwh'),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      buildItemDetail(
                          "Type Network", site.networkType!),

                      //préparation for google maps
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),


                      InkWell(
                        onTap: () {
                          openMapScreen(context);
                        },
                        child: Container(
                          width: screenWidth * 0.45,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Voir local sur le map',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: rubikFontRegular,
                                    fontWeight: FontWeight.w700,
                                    color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: screenWidth * 0.5,
                height: 40,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    isSharing,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemDetail(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: rubikFontRegular,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: rubikFontSemiBold,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemDetailBadge(String title, String info, int colorBadge) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: rubikFontRegular,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor),
            ),
          ),
          Flexible(
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorBadge == 0 ? Colors.red : greenColor),
              child: Center(
                child: Text(
                  info,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: rubikFontRegular,
                      fontWeight: FontWeight.w700,
                      color: whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void openMapScreen(BuildContext context) {
    showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.87,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,                       
                        children: <Widget>[
                          Container(
                            height: 70,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)
                              )
                            ),
                            child: const Center(
                              child: Text(
                                  "Localisation",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: rubikFontMedium,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryColor),
                                ),
                            )
                          ),

                          const Divider(color: greyEtentColor,),


                          const LocalisationSiteWidget()
                        ],
                      ),
                    ),
                  );
                },
              );
  }
}
