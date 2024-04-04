import 'package:flutter/material.dart';

class ListVisitWidget extends StatelessWidget {
  const ListVisitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: const [
            Text("hello"),
            Text("hello"),
            Text("hello"),
            Text("hello"),
          ],
        );
  }
}