import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav.dart';
import 'package:orange_grs/core/widgets/snackbar.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/main.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    TextEditingController _password = TextEditingController();
    TextEditingController _login = TextEditingController();

    return BlocConsumer<LoginBlocBloc, LoginState>(
      builder: (context, state) {

        if(state is LoadingLoginState){
          return const Center(child: CircularProgressIndicator(),);
        }else{
            return Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      textInputAction: TextInputAction.next,
                      controller: _login,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        contentPadding: const EdgeInsets.all(20),
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "Login",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: secondaryColor)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      textInputAction: TextInputAction.done,
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        contentPadding: const EdgeInsets.all(20),
                        prefixIcon: const Icon(Icons.password_outlined),
                        hintText: "Mot de passe",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: secondaryColor)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        BlocProvider.of<LoginBlocBloc>(context).add(SignInEvent(login: _login.text, password: _password.text));
                      }
                    },
                    child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "se connecter",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ],
              ),
            );
        }
        
      }, listener: (BuildContext context, LoginState state) { 
        if(state is ErrorLoginState){
          SnackbarMessage().showErrorSnackBar(message: state.errorMessage, context: context);
        }else if (state is LoadedLoginState){
          sharedPref.setString('token', state.loginResponse.token);
          sharedPref.setBool('isAdmin', state.loginResponse.isAdmin);
          SnackbarMessage().showSuccessSnackBar(message: "Connexion réussie", context: context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNav(),));
        }
       },
    );
  }
}
