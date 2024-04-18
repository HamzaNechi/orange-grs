import 'package:flutter/material.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/presentation/widgets/item_list_visit_widget.dart';

class ListVisitWidget extends StatelessWidget {
  final List<Visite> visites;
  const ListVisitWidget({super.key, required this.visites});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widgetHeigth = constraints.maxHeight;
        return ListView.builder(
                itemCount: visites.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: widgetHeigth * 0.02,),
                      ItemListVisiteWidget(constraints: constraints, visite: visites[index],),
                    ],
                  );
                },
                );
      },
    );
  }
}