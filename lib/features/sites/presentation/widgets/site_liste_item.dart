import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/responsive/responsiveController.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';

class SiteListItemWidget extends StatelessWidget {
  final Site site;
  const SiteListItemWidget({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final deviceType = ResponsiveController().getDeviceType(mediaQueryData);
    print(deviceType);

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

    final siteType = site.elecType == 1 ? 'BT' : 'HT';
    return LayoutBuilder(
      builder: (context, constraints) {
        double localWidth = constraints.maxWidth;
        return InkWell(
          onTap: () {
            print("Voir factures");
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
                title: Text(site.siteCode!, style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                subtitle:Text(site.siteRef, style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 16),),
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