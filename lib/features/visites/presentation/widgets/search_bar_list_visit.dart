import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';

class SearchBarListVisitWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const SearchBarListVisitWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final localHeight = constraints.maxHeight;
    final localWidth = constraints.maxWidth;
    TextEditingController serachController = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return SizedBox(
      width: localWidth,
      height: localHeight * 0.17,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
             const Text("Visites", style: TextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Rubik-Medium'),),
             const SizedBox(height: 5,),
             Expanded(
               child: Row(

                 children: [
                   SizedBox(
                    width: localWidth * 0.8,
                     child: Form(
                      key: _key,
                       child: TextFormField(
                        controller: serachController,
                        decoration: const InputDecoration(
                          hintText: 'Chercher par site',
                          prefixIcon: Icon(CupertinoIcons.search),
                        ),
                        onChanged: (value) {
                        },
                             
                       ),
                     ),
                   ),


                  const SizedBox(width: 10,),
             
             
                   InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                        ),
                        enableDrag: true,
                        backgroundColor: Colors.white,
                        context: context, 
                        builder: (context) {
                          return _buildBottomSheetContent(context,localHeight, localWidth);
                        },);
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
                          CupertinoIcons.slider_horizontal_3,
                          color: primaryColor,
                        ),
                      ),
                    ),
                   )
                 ],
               ),
             ),
      
             const SizedBox(height: 10,),
      
             const Divider(color: greyColor, height: 10,)
          ],
        ),
      ),
    );
  }



  Widget _buildBottomSheetContent(BuildContext context,double localHeight, double localWidth){
    final TextEditingController _dateController = TextEditingController();
    return Container(
      height: localHeight * 0.4,
    decoration:const BoxDecoration(
      color: greyBottomNav,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
      ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: localWidth * 0.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: secondaryColor.withOpacity(0.4),
                ),
              ),
            ],
          ),


          const SizedBox(height: 30,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: StatefulBuilder(
              builder: (context, setState){
                return TextFormField(
                  controller: _dateController,
                  keyboardType: TextInputType.none,
                  onTap: () async {
                    print('print date');
                    final DateTime? _picker = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime(2023), 
                      lastDate: DateTime.now(),
                      locale: const Locale('fr'),
                      cancelText: 'Annuler',
                      );

                      setState(() {
                        _dateController.text = _picker!.toString();
                      },);
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Date d'insertion",
                    contentPadding: EdgeInsets.all(12),
                    filled: true,
                    fillColor: whiteColor,
                    suffixIcon: Icon(Icons.date_range_sharp),
                    hintStyle: TextStyle(
                      color: greyForTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                );
              },
              
            ),
          ),



          const SizedBox(height: 10,),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Date d'insertion",
                contentPadding: EdgeInsets.all(15),
                filled: true,
                fillColor: whiteColor,
                suffixIcon: Icon(Icons.date_range_sharp),
                hintStyle: TextStyle(
                  color: greyForTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}