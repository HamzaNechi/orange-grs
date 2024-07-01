import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/features/auth/domain/entities/user.dart';
import 'package:orange_grs/features/auth/presentation/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/features/auth/presentation/widgets/pofile_widget.dart';
import 'package:orange_grs/features/auth/presentation/widgets/pofile_widget_withoutuser.dart';
import 'package:orange_grs/main.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<LoginBlocBloc, LoginState>(
        listener: (context, state) {
          if(state is ExpiredJwtState){
            sharedPref.setString('token', '');
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(
                builder: (context) => const LoginPage(),), 
              (route) => false);
          }
        },
        builder: (context, state) {
          if(state is GetConnectedUserState){
            final User user = state.user;
            return ProfileWidget(user: user);
          }else if(state is ErrorProfileState){
            return const ProfileWidgetWithoutUser();
          }else if (state is LoadingLoginState){
            return const ProfileWidgetWithoutUser();
          }else{
            return const ProfileWidgetWithoutUser();
          }
          
        },
      ),
    );
  }
}
