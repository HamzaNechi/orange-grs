import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:searchfield/searchfield.dart';

class SearchableFieldSiteForAddVisite extends StatelessWidget {
  final ValueChanged<Site> onSubmit;
  const SearchableFieldSiteForAddVisite({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SiteBloc, SiteState>(
                            builder: (context, state) {
                              if(state is LoadedSiteState){
                                return SearchField<Site>(               
                                  searchInputDecoration: const InputDecoration(
                                      hintText: 'Séléctionner le site',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.number),
                                      ),
                                  itemHeight: 40,
                                  maxSuggestionsInViewPort: 5,
                                  textInputAction: TextInputAction.next,
                                  onSuggestionTap: (p) {
                                    onSubmit(p.item!);
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
                                return const CircularProgressIndicator();
                              }else if(state is ErrorSiteState){
                                return const CircularProgressIndicator();
                              }

                              return const CircularProgressIndicator();
                              
                            },
                          );
  }
}