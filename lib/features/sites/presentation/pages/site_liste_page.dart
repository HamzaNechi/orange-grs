import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_list_site/loading_widget.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_list_site/site_liste_item.dart';


class SiteListPage extends StatelessWidget {
  const SiteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            _searchBar(constraints, context),
            Expanded(
              child: BlocBuilder<SiteBloc,SiteState>(
                builder: (context, state) {
                  if(state is LoadingSiteState){
                    return const LoadingWidget();
                  }else if(state is LoadedSiteState){
                    return ListView.builder(
                      itemCount: state.sites.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SiteListItemWidget(site: state.sites[index]),
                            const SizedBox(height: 10,)
                          ],
                        );
                      },
                    );
                  }else if(state is ErrorSiteState){
                    SnackbarMessage().showErrorSnackBar(context: context, message: state.message);
                  }

                  return const LoadingWidget();
                },
              ),
            ),
          ],
                );
          
        },
        
      ),
      );
  }
  
  _searchBar(BoxConstraints constraints, BuildContext context) {
    final localHeight = constraints.maxHeight;
    final localWidth = constraints.maxWidth;
    TextEditingController serachController = TextEditingController();
    return SizedBox(
      width: localWidth,
      height: localHeight * 0.17,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
             const Text("Sites", style: TextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Rubik-Medium'),),
             const SizedBox(height: 5,),
             TextFormField(
              controller: serachController,
              decoration: const InputDecoration(
                hintText: 'Chercher par code site',
                prefixIcon: Icon(CupertinoIcons.search),
              ),
              onChanged: (value) {
                if(value.isNotEmpty){
                  BlocProvider.of<SiteBloc>(context).add(SearchSiteEvent(siteCode: value));
                }else{
                  BlocProvider.of<SiteBloc>(context).add(GetAllSiteEvent());
                }
              },
        
             ),
      
             const SizedBox(height: 10,),
      
             const Divider(color: greyColor, height: 10,)
          ],
        ),
      ),
    );
  }
}