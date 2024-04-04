import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_grs/core/navigations/bottom_nav.dart';
import 'package:orange_grs/core/responsive/responsiveController.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {

    bool toLoginOrDashboard = sharedPref.getString("token") == null || sharedPref.getString("token")!.isEmpty;

    Future.delayed(
      const Duration(seconds:4), 
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => toLoginOrDashboard ? const LoginPage() : const BottomNav(),));
    });

    DeviceType deviceType = ResponsiveController().getDeviceType(MediaQuery.of(context));
    
    return Scaffold(
      body: _buildBody(deviceType),
    );
  }
  
  Widget _buildBody(DeviceType deviceType) {
    if(deviceType == DeviceType.Desktop){
      return const SplashScreenMobile();
    }else if( deviceType == DeviceType.Tablet ){
      return const SplashScreenTablet();
    }else{
      return const SplashScreenMobile();
    }
  }
}


class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: screenWidth * 0.8,
            height:screenWidth * 0.8,
            child: Lottie.asset("assets/animations/background.json"),
          ),
    
    
          Positioned(
            left: screenWidth * 0.3,
            bottom: screenWidth * 0.3,
            right: screenWidth * 0.3,
            top: screenWidth * 0.3,
            child: Container(
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                  )
              ),
              ),
          )
        ],
      ),
    );
  }
}



class SplashScreenTablet extends StatelessWidget {
  const SplashScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: screenWidth * 0.8,
            height:screenWidth * 0.8,
            child: Lottie.asset("assets/animations/background.json"),
          ),
    
    
          Positioned(
            left: screenWidth * 0.3,
            bottom: screenWidth * 0.3,
            right: screenWidth * 0.3,
            top: screenWidth * 0.3,
            child: Container(
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                  )
              ),
              ),
          )
        ],
      ),
    );
  }
}