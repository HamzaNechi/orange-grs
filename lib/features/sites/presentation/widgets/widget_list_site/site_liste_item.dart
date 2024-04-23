import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/responsive/responsiveController.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/pages/site_detail_page.dart';

class SiteListItemWidget extends StatelessWidget {
  final Site site;
  const SiteListItemWidget({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final deviceType = ResponsiveController().getDeviceType(mediaQueryData);

    if(deviceType == DeviceType.Mobile){
      return SiteListItemWidgetMobile(site: site,);
    }else if(deviceType == DeviceType.Tablet){
      return const SiteListItemWidgetTablet();
    }else{
      return const SiteListItemWidgetDesktop();
    }
  }
}


class SiteListItemWidgetMobile extends StatelessWidget {
  final Site site;
  const SiteListItemWidgetMobile({super.key, required this.site});

  @override
  Widget build(BuildContext context) {

    final siteType = site.elecType == 1 ? 'BT' : 'MT';
    return LayoutBuilder(
      builder: (context, constraints) {
        double localWidth = constraints.maxWidth;
        return InkWell(
          onTap: () {
            final siteBloc = BlocProvider.of<SiteBloc>(context);
            siteBloc.add(NombreFactureReelEvent(siteIdd: site.siteId!));
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SiteDetailPage(site: site),));
          },
          child: Container(
            width: localWidth,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: greyEtentColor
            ),
        
            child: Center(
              child: ListTile(
                title: Text(site.siteCode!, style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: rubikFontSemiBold),),
                subtitle:Text(site.siteRef, style: TextStyle(color: secondaryColor.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16, fontFamily: rubikFontSemiBold),),
                trailing: const Icon(Icons.arrow_forward_ios , size: 27,),
                leading: Container(
                  width: localWidth / 8,
                  height: localWidth / 8,
                  decoration: BoxDecoration(
                    color: siteType == 'BT' ? secondaryColor : primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
            
                  child: Center(child: Text(siteType, style: TextStyle(color: siteType == 'BT' ? primaryColor : secondaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class SiteListItemWidgetTablet extends StatelessWidget {
  const SiteListItemWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class SiteListItemWidgetDesktop extends StatelessWidget {
  const SiteListItemWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}