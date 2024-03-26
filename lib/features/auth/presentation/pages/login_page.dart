import 'package:flutter/material.dart';
import 'package:orange_grs/core/responsive/responsiveController.dart';
import 'package:orange_grs/features/auth/presentation/widgets/login_from.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    DeviceType deviceType = ResponsiveController().getDeviceType(MediaQuery.of(context));
    return Scaffold(
      body: _buildBody(deviceType),
    );
  }
  
  Widget _buildBody(DeviceType deviceType) {
    if(deviceType == DeviceType.Desktop){
      return const LoginPageDesktop();
    }else if(deviceType == DeviceType.Tablet){
      return const LoginPageTablet();
    }else{
      return const LoginPageMobile();
    }
  }
}


class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover
                )
            ),
          ),


          const LoginFormWidget()
        ],
      ),
      );
  }
}



class LoginPageDesktop extends StatelessWidget {
  const LoginPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class LoginPageTablet extends StatelessWidget {
  const LoginPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}