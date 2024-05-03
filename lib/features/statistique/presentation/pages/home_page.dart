import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/widgets/search_field_site_widget.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_event.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_state.dart';
import 'package:orange_grs/features/statistique/presentation/widgets/line_chart_widget.dart';
import 'package:orange_grs/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late Site? site;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.12,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: SearchFieldSiteWidget(
                    hintText: "Choisir un site",
                    onChange: (value) {
                      site = value;
                      BlocProvider.of<FactureSiteBloc>(context)
                          .add(GetAllFactureSiteEvent(siteId: site!.siteId!));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: const Text(
                           "Consommation d'énergie par site en TND :",
                           style: TextStyle(
                           fontSize: 15,
                           fontFamily: rubikFontMedium,
                           fontWeight: FontWeight.w500,
                           color: greyForTextColor),
                       ),
                ),
                 
              ],
            ),

            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: BlocConsumer<FactureSiteBloc, FactureSiteState>(
                    listener: (BuildContext context, FactureSiteState state) { 
                        if(state is ErrorFactureSiteState){
                          SnackbarMessage().showErrorSnackBar(context: context, message: state.message);
                        }

                        if(state is ExpiredTokenDetailSiteState){
                          sharedPref.setString('token','');
                          SnackbarMessage().showErrorSnackBar(context: context, message: EXPIRED_TOKEN_FAILURE_MESSAGE);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
                        }
                    },
                    builder: (context, state) {
                      if(state is LoadedFactureSiteState){
                        return LineChartWidget(listFactures: state.siteFactures,);
                      }else{
                        return const LineChartWidget();
                      }
                      
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
