import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/features/sites/presentation/widgets/site_liste_item.dart';

class SiteListPage extends StatelessWidget {
  const SiteListPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> listType = ['HT','BT','BT','HT','BT','HT','HT','HT','BT','BT','HT','BT','HT','HT','HT'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            _searchBar(constraints),
            Expanded(
              child: ListView.builder(
                itemCount: listType.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SiteListItemWidget(siteType: listType[index]),
                      const SizedBox(height: 10,)
                    ],
                  );
                },
              ),
            ),
          ],
                );
          
        },
        
      ),
      );
  }
  
  _searchBar(BoxConstraints constraints) {
    final localHeight = constraints.maxHeight;
    final localWidth = constraints.maxWidth;
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
              decoration: const InputDecoration(
                hintText: 'Chercher par code site',
                prefixIcon: Icon(CupertinoIcons.search),
              ),
      
        
             ),
      
             const SizedBox(height: 10,),
      
             const Divider(color: greyColor, height: 10,)
          ],
        ),
      ),
    );
  }
}