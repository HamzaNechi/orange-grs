import 'package:flutter/material.dart';
import 'package:shimmer_loading/shimmer_loading.dart';

class LoadingSearchFieldWidget extends StatelessWidget {
  const LoadingSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ShimmerLoading(
                    child: Container(
                              width: screenWidth * 0.7,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),
                  ),
    );
  }
}