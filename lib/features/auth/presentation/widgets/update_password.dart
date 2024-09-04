import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/widgets/second_app_bar.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';

class UpdatePasswordUserWidget extends StatelessWidget {
  const UpdatePasswordUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newPassController = TextEditingController();
    GlobalKey<FormState> keyFormUpdatePass = GlobalKey<FormState>();
    return Scaffold(
      appBar: SecondAppBarWidget(contextX: context),
      body: BlocListener<ProfileBloc, ProfileState>(
        child: Form(
        key: keyFormUpdatePass,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                                controller: newPassController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Champ Obligatoire !";
                                  }
                                  if(value.length < 6) {
                                    return "Password doit etre composé de 8 caractére";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Nouveau mot de passe',
                                    contentPadding: EdgeInsets.all(10)
                                    //prefixIcon: Icon(CupertinoIcons.number),
                                    ),
                              ),


                    const SizedBox(height: 20,),


                    InkWell(
                              onTap: () {
                                BlocProvider.of<ProfileBloc>(context).add(UpdateProfilePasswordEvent(newPassword: newPassController.text));
                              },
                              child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(
                                    child: Text(
                                      "Modifier",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                ],
              ),
            )), 
        listener: (context, state) {
          if(state is UpdatedPasswordState){
            SnackbarMessage().showSuccessSnackBar(message: state.message, context: context);
            sharedPref.setString('token', '');
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(
                builder: (context) => const LoginPage(),), 
              (route) => false);
          }else if (state is ErrorUpdatedPasswordState){
            SnackbarMessage().showErrorSnackBar(message: state.message, context: context);
          }
        },
        )
    );
  }
}