import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/pages/add_visite_page.dart';
import 'package:orange_grs/features/visites/presentation/widgets/loading_search_field.dart';
import 'package:searchfield/searchfield.dart';

class SearchBarListVisitWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const SearchBarListVisitWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final localHeight = constraints.maxHeight;
    final localWidth = constraints.maxWidth;
    TextEditingController searchController = TextEditingController();
    



    Widget buildSearchableField(){
      return BlocBuilder<SiteBloc, SiteState>(
        builder: (context, state) {


        if(state is LoadedSiteState){
          return SearchField<Site>(   
            controller: searchController,          
            searchInputDecoration: const InputDecoration(
                                      hintText: 'Chercher par site',
                                      contentPadding: EdgeInsets.all(10),
                                      prefixIcon: Icon(CupertinoIcons.search)
                                      ),
                                  itemHeight: 40,
                                  maxSuggestionsInViewPort: 5,
                                  textInputAction: TextInputAction.next,
                                  onSuggestionTap: (p) {
                                    BlocProvider.of<VisiteBloc>(context).add(SearchVisiteBySiteEvent(codeSite: p.item!.siteCode!));
                                    searchController.text = "";
                                    FocusScope.of(context).unfocus();
                                  },
                                  suggestionsDecoration: SuggestionDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      padding: const EdgeInsets.all(10)),
                                  suggestionStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: rubikFontRegular,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryColor),
                                  suggestions: state.sites.map((site) => SearchFieldListItem<Site>(site.siteCode.toString() , item: site)).toList()
                                  );
                              }else if(state is LoadingSiteState){
                                return const LoadingSearchFieldWidget();
                              }else if(state is ErrorSiteState){
                                return const LoadingSearchFieldWidget();
                              }

                              return const LoadingSearchFieldWidget();
                              
                            },
                          );
  }


    return SizedBox(
      width: localWidth,
      height: localHeight * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
             const Text("Visites", style: TextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Rubik-Medium'),),
             //const SizedBox(height: 1,),
             Expanded(
               child: Row(

                 children: [
                   SizedBox(
                    width: localWidth * 0.8,
                     child: buildSearchableField(),
                   ),


                  SizedBox(width: localWidth * 0.028,),
             
             
                   InkWell(
                    onTap: () {
                      BlocProvider.of<SiteBloc>(context).add(GetAllSiteEvent());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddVisitePage(),));
                    },
                    child: Container(
                      width: localWidth * 0.117,
                      height: localWidth * 0.117,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondaryColor
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 27,
                          color: primaryColor,
                        ),
                      ),
                    ),
                   )
                 ],
               ),
             ),
      
             const Divider(color: greyColor, height: 10,)
          ],
        ),
      ),
    );



    
  }


  
}