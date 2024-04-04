import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_event.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_state.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/item_facture_site.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/loading_page_facture.dart';
import 'package:orange_grs/main.dart';




class ListFactureSite extends StatelessWidget {
  final int siteId;
  const ListFactureSite({super.key, required this.siteId});

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocConsumer<FactureSiteBloc, FactureSiteState>(
          builder: (context, state) {

            if(state is LoadingFactureSiteState){
              return const LoadingListFactureWidget();
            }else if (state is LoadedFactureSiteState){
              return RefreshIndicator(
                onRefresh: () async{
                  BlocProvider.of<FactureSiteBloc>(context).add(RefreshFactureSiteEvent(siteId:siteId));
                },
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15,);
                  },
                  itemCount: state.siteFactures.length,
                  itemBuilder: (context, index) {
                    return ItemFactureSite(constraints: constraints, facture: state.siteFactures[index],);
                  },),
              );
            }else if(state is ErrorFactureSiteState){
              return Center(
                child: Lottie.asset("assets/animations/alert.json"),
              );
            }

            return const LoadingListFactureWidget();
            
          }, listener: (BuildContext context, FactureSiteState state) { 
              if(state is ErrorFactureSiteState){
                SnackbarMessage().showErrorSnackBar(context: context, message: state.message);
              }

              if(state is ExpiredTokenDetailSiteState){
                sharedPref.setString('token','');
                SnackbarMessage().showErrorSnackBar(context: context, message: EXPIRED_TOKEN_FAILURE_MESSAGE);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
              }
           },
        );
      }, 
    );
  }
}