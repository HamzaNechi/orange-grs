import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/strings/fonts.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/reclamation/presentation/blocs/reclamation_bloc/reclamation_bloc.dart';
import 'package:orange_grs/features/reclamation/presentation/widgets/reclamation_form_widget.dart';

class AddReclamationPage extends StatelessWidget {
  const AddReclamationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SecondAppBarWidget(contextX: context),
      body: BlocListener<ReclamationBloc, ReclamationState>(
        listener: (context, state) {
          if(state is NewReclamationAddedState){
            SnackbarMessage().showSuccessSnackBar(
                                    message: state.message, context: context);
            BlocProvider.of<ReclamationBloc>(context).add(ResetFormReclamationEvent());
          }else if( state is ErrorReclamationState){
            SnackbarMessage().showErrorSnackBar(
                                    message: state.message, context: context);
          }else if(state is ExpiredJwtState){
            SnackbarMessage().showErrorSnackBar(
                                    message: state.message, context: context);
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => const LoginPage(),), 
              (route) => false);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headOfPageWidget(screenHeight, screenWidth),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  const ReclamationFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget headOfPageWidget(double screenHeight, double screenWidth) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.16,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Déclaration de Problème',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: rubikFontMedium,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor),
                ),
              ),
              Expanded(
                child: Text(
                  "Signalez tout problème rencontré dans l'application ou problème technique avec le compteur.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: rubikFontRegular,
                      fontWeight: FontWeight.w400,
                      color: greyForTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
