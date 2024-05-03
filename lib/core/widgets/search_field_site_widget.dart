import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/features/sites/domain/entities/site.dart';
import 'package:orange_grs/features/sites/presentation/bloc/bloc_list_site/site_bloc.dart';
import 'package:orange_grs/features/visites/presentation/widgets/loading_search_field.dart';
import 'package:searchfield/searchfield.dart';

class SearchFieldSiteWidget extends StatefulWidget {
  final ValueChanged onChange;
  final String hintText;
  const SearchFieldSiteWidget({super.key, required this.onChange, required this.hintText,});

  @override
  State<SearchFieldSiteWidget> createState() => _SearchFieldSiteWidgetState();
}

class _SearchFieldSiteWidgetState extends State<SearchFieldSiteWidget> {

  TextEditingController searchSiteXController = TextEditingController();


  @override
  void initState() {
    searchSiteXController.text = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SiteBloc, SiteState>(
        builder: (context, state) {
        if(state is LoadedSiteState){
          return SearchField<Site>(   
            controller: searchSiteXController,          
            searchInputDecoration: InputDecoration(
                                      hintText: widget.hintText,
                                      contentPadding:const EdgeInsets.all(10),
                                      prefixIcon: const Icon(CupertinoIcons.location)
                                      ),
                                  itemHeight: 40,
                                  maxSuggestionsInViewPort: 5,
                                  textInputAction: TextInputAction.next,
                                  onSuggestionTap: (p) {
                                    setState(() {
                                      searchSiteXController.text = p.item!.siteCode!;
                                    });
                                    
                                    widget.onChange(p.item!);
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
}