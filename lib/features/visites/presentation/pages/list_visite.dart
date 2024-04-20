import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_grs/core/strings/failures.dart';
import 'package:orange_grs/core/widgets/loading_widget.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_bloc.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_event.dart';
import 'package:orange_grs/features/visites/presentation/bloc/visit_bloc/visite_state.dart';
import 'package:orange_grs/features/visites/presentation/widgets/list_visit_widget.dart';
import 'package:orange_grs/features/visites/presentation/widgets/search_bar_list_visit.dart';
import 'package:orange_grs/main.dart';


class ListVisite extends StatelessWidget {
  const ListVisite({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            SearchBarListVisitWidget(constraints: constraints),
            Expanded(
              child: BlocConsumer<VisiteBloc,VisiteState>(
                builder: (context, state) {
                  if(state is LoadingVisiteState){
                    return const LoadingWidget();
                  }else if(state is LoadedVisiteState){
                    return RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<VisiteBloc>(context).add(GettAllVisitesEvent());
                      },
                      child: ListVisitWidget(visites: state.visites));
                  }else if (state is ErrorVisiteState){
                    return Center(
                      child: SizedBox(
                        height: screenHeight,
                        width: screenWidth,
                        child: Lottie.asset("assets/animations/alert.json")));
                  }

                  return const LoadingWidget();
                }, 
                listener: (BuildContext context, VisiteState state) { 
                  if(state is ErrorVisiteState){
                    SnackbarMessage().showErrorSnackBar(message: state.message, context: context);
                  }else if(state is ExpiredTokenState){
                    sharedPref.setString('token','');
                    SnackbarMessage().showErrorSnackBar(context: context, message: EXPIRED_TOKEN_FAILURE_MESSAGE);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
                  }else if(state is DeletedVisiteState){
                    BlocProvider.of<VisiteBloc>(context).add(GettAllVisitesEvent());
                    SnackbarMessage().showSuccessSnackBar(context: context, message: "Visite supprimé");
                  }
                 },
              ),
            ),
          ],
                );
          
        },
        
      ),
      );
  }
}