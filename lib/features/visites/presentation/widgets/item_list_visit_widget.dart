import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/features/visites/domain/entities/visite.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/pages/detail_visite_page.dart';
import 'package:orange_grs/features/visites/presentation/pages/update_visite_page.dart';
import 'package:orange_grs/features/visites/presentation/widgets/alert_confirmation_suppression_widget.dart';
import 'package:orange_grs/main.dart';

class ItemListVisiteWidget extends StatelessWidget {
  final Visite visite;
  final BoxConstraints constraints;
  const ItemListVisiteWidget({super.key, required this.constraints, required this.visite});

  @override
  Widget build(BuildContext context) {
    final parentWidth = constraints.maxWidth;
    final parentHeight = constraints.maxHeight;
    
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(visite.dateInsertion!);
    bool isAdmin = sharedPref.getBool('isAdmin')!;

    final ifAdminHeightBox = isAdmin ? parentHeight * 0.305 : parentHeight * 0.215;
    final boxHeight = MediaQuery.of(context).size.height > 700 ? ifAdminHeightBox : ifAdminHeightBox * 1.2 ;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailVisitePage(visite: visite,),));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: parentWidth * 0.95,
            // ignore: dead_code
            height: boxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: greySurBackColor,
                width: 1
              )
            ),
      
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (parentHeight * 0.015)*2, vertical: parentHeight * 0.015),
              child: Column(
                children: [
      
                  
      
                  _buildLineInfo('Index', '${visite.indexCompteur}',context),
      
                  _buildLineInfo('Site', visite.site.siteCode!,context),
      
      
                  _buildLineInfo('Responsable', visite.responsable!,context),
      
      
                  _buildLineInfo('Date', formattedDate ,context),
      
                  Visibility(
                    visible: isAdmin,
                    child: _buildControlePanelAdmin(parentHeight, parentWidth, context, visite.visiteId!))
                  
                ],
              ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineInfo(String title, String info, BuildContext context){
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),),

                    Text(info, 
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400, 
                      fontSize: 14, color: greyForTextColor),),
                  ],
                );
  }


  Widget _buildControlePanelAdmin(double parentHeight, double parentWidth, BuildContext context, int idVisite){
    return Column(
      children: [
        SizedBox(height: parentHeight * 0.008,),

                const Divider(height: 10, color: greyBottomNav,),


                SizedBox(height: parentHeight * 0.003,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateVisitePage(visite: visite),));
                      },
                      child: Container(
                        width: parentWidth * 0.08,
                        height: parentWidth * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: blueColor
                        ),

                        child: const Center(
                          child: Icon(Icons.edit, color: whiteColor,),
                        ),
                      ),
                    ),


                    const SizedBox(width: 8,),


                    InkWell(
                      onTap: () async{
                        bool shouldDelete;
                        shouldDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const DeleteConfirmationDialog();
                          },
                        );

                        if(shouldDelete) {
                          BlocProvider.of<VisiteBloc>(context).add(DeleteVisiteByIdEvent(visiteId: idVisite));
                        }
                      },
                      child: Container(
                        width: parentWidth * 0.08,
                        height: parentWidth * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red
                        ),

                        child: const Center(
                          child: Icon(Icons.delete, color: whiteColor,),
                        ),
                      ),
                    )
                  ],
                ),
      ],
    );
  }
}