import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_event.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/detail_site_widget.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/list_facture_site.dart';

class SiteDetailPage extends StatelessWidget {
  final Site site;
  const SiteDetailPage({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SecondAppBarWidget(contextX: context, title: site.siteCode,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 20,),


            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: secondaryColor,
              indicatorColor: primaryColor,
              dividerColor: greyColor,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontFamily: rubikFontSemiBold,
                fontWeight: FontWeight.w500
              ),
              onTap: (value) {
                if(value == 1){
                  final factureSiteBloc = BlocProvider.of<FactureSiteBloc>(context);
                  factureSiteBloc.add(GetAllFactureSiteEvent(siteId: site.siteId!));
                }

                if(value == 0){
                  final siteBloc = BlocProvider.of<SiteBloc>(context);
                  siteBloc.add(NombreFactureReelEvent(siteIdd: site.siteId!));
                }
              },
              tabs: const [
                Tab(
                  text: "Détails",
                ),

                Tab(
                  text: "Factures",
                ),
              ] ),


              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TabBarView(
                    children: [
                      SiteDetailWidget(site: site),
                  
                  
                      ListFactureSite(siteId: site.siteId!,)
                    ]
                    ),
                  ),
              )




          ],
        ),
      ),
    );
  }
}
