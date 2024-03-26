import 'package:flutter/material.dart';
import 'package:shimmer_loading/shimmer_loading.dart';

class LoadingListFactureWidget extends StatelessWidget {
  const LoadingListFactureWidget({super.key});

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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              width: screenWidth * 0.35,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),

                            const SizedBox(height: 5,),


                            Container(
                              width: screenWidth * 0.35,
                              height: 12,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xFFEBEBF4),
                              ),
                            ),
                          ],
                        ),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              width: screenWidth * 0.35,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),

                            const SizedBox(height: 5,),


                            Container(
                              width: screenWidth * 0.35,
                              height: 12,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xFFEBEBF4),
                              ),
                            ),
                          ],
                        ),




                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              width: screenWidth * 0.35,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),

                            const SizedBox(height: 5,),


                            Container(
                              width: screenWidth * 0.35,
                              height: 12,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xFFEBEBF4),
                              ),
                            ),
                          ],
                        ),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              width: screenWidth * 0.35,
                              height: 15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromARGB(255, 235, 235, 241),
                              ),
                            ),

                            const SizedBox(height: 5,),


                            Container(
                              width: screenWidth * 0.35,
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