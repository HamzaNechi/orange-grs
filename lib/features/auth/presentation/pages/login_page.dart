import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav.dart';
import 'package:orange_grs/core/responsive/responsiveController.dart';

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

          Column(
        
            children: [
              Container(
                height: 70,
                child: TextFormField(
                  cursorColor: primaryColor,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: secondaryColor
                      )
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: primaryColor
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5,),

              Container(
                height: 70,

                child: TextFormField(
                  cursorColor: primaryColor,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.password_outlined),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: secondaryColor
                      )
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: primaryColor
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5,),


              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNav(),));
                },
                child: Container(
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Center(
                    child: Text("se connecter", style:  TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w500),),
                  )
                ),
              ),
            ],
          ),



          


          
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