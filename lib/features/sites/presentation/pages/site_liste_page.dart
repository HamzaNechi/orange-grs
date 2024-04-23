import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/core/widgets/loading_widget.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/sites/presentation/widgets/widget_list_site/site_liste_item.dart';
import 'package:orange_grs/main.dart';


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
              child: BlocConsumer<SiteBloc,SiteState>(
                builder: (context, state) {
                  if(state is LoadingSiteState){
                    return const LoadingWidget();
                  }else if(state is LoadedSiteState){
                    return RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<SiteBloc>(context).add(RefreshListSiteEvent());
                      },
                      child: _buildListSites(state.sites));
                  }else if (state is ErrorSiteState){
                    return Center(
                      child: SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: Lottie.asset("assets/animations/alert.json")));
                  }

                  return const LoadingWidget();
                }, listener: (BuildContext context, SiteState state) { 
                  if(state is ExpiredTokenState){
                    sharedPref.setString('token','');
                    SnackbarMessage().showErrorSnackBar(context: context, message: EXPIRED_TOKEN_FAILURE_MESSAGE);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
                  }else if(state is ErrorSiteState){
                    SnackbarMessage().showErrorSnackBar(context: context, message: state.message);
                  }
                 },
              ),
            ),
          ],
                );
          
        },
        
      ),
      );
  }


  ListView _buildListSites(List<Site> sites){
    return ListView.builder(
                      itemCount: sites.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SiteListItemWidget(site: sites[index]),
                            const SizedBox(height: 10,)
                          ],
                        );
                      },
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
                hintText: 'Chercher par code site ou référence',
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