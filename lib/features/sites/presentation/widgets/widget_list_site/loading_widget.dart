import 'package:flutter/material.dart';
import 'package:shimmer_loading/shimmer_loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: const [
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
          LoadingItem(),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}


class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return ShimmerLoading(
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromARGB(255, 235, 235, 241),
                          ),
                          child: const UnconstrainedBox(
                              child: CircularProgressIndicator.adaptive()),
                        ),

                        const SizedBox(width: 10,),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth * 0.6,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),

                            const SizedBox(height: 5,),


                            Container(
                              width: screenWidth * 0.4,
                              height: 12,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xFFEBEBF4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }
}