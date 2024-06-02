import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/navigations/bottom_nav.dart';
import 'package:orange_grs/features/auth/presentation/pages/login_page.dart';
import 'package:orange_grs/main.dart';

class GetIpAddress extends StatelessWidget {
  const GetIpAddress({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController ipController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                                  controller: ipController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Entrer @IP',
                                      contentPadding: EdgeInsets.all(10)
                                      //prefixIcon: Icon(CupertinoIcons.text_aligncenter),
                                      ),
                                  onChanged: (value) {
                                    
                                  },
                                ),


           const SizedBox(height: 10,),


           InkWell(
                                onTap: () {

                                  sharedPref.setString('ip', ipController.text);
                                  bool toLoginOrDashboard = sharedPref.getString("token") == null || sharedPref.getString("token")!.isEmpty;
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => toLoginOrDashboard ? const LoginPage() : const BottomNav(),));
                                  
                                },
                                child: Container(
                                    height: 70,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                      child: Text(
                                        "Suivant",
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ),
          ],
        ),
        ),
    );
  }
}