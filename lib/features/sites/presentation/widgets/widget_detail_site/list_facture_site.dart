import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_detail_site/facture_site_state.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/item_facture_site.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_detail_site/loading_page_facture.dart';




class ListFactureSite extends StatelessWidget {
  const ListFactureSite({super.key});

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<FactureSiteBloc, FactureSiteState>(
          builder: (context, state) {

            if(state is LoadingFactureSiteState){
              return const LoadingListFactureWidget();
            }else if (state is LoadedFactureSiteState){
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15,);
                },
                itemCount: state.siteFactures.length,
                itemBuilder: (context, index) {
                  return ItemFactureSite(constraints: constraints, facture: state.siteFactures[index],);
                },);
            }else if(state is ErrorFactureSiteState){
              SnackbarMessage().showErrorSnackBar(context: context, message: state.message);
            }

            return const LoadingListFactureWidget();
            
          },
        );
      }, 
    );
  }
}