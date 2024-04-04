import 'package:flutter/material.dart';
import 'package:orange_grs/features/visites/presentation/widgets/list_visit_widget.dart';
import 'package:orange_grs/features/visites/presentation/widgets/search_bar_list_visit.dart';



class ListVisit extends StatelessWidget {
  const ListVisit({super.key});

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
            SearchBarListVisitWidget(constraints: constraints),
            const Expanded(
              child: ListVisitWidget(),
            ),
          ],
        );
          
        },
        
      ),
    );
  }
}