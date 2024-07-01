import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:url_launcher/url_launcher.dart';




class LocalisationSiteWidget extends StatefulWidget {
  const LocalisationSiteWidget({super.key});

  @override
  State<LocalisationSiteWidget> createState() => _LocalisationSiteWidgetState();
}

class _LocalisationSiteWidgetState extends State<LocalisationSiteWidget> {
  static const LatLng siteLocation = LatLng(36.838947643092496, 10.203958455794425);

  static const String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=36.838947643092496,10.203958455794425";

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(googleMapslocationUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl();
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
              target: siteLocation,
              zoom: 14.5
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('source'),
                  position: siteLocation
                  )
              },
            ),


            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                  _launchUrl();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    side: const BorderSide(color: secondaryColor, width: 1),
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                        fontSize: 16, 
                        fontStyle: FontStyle.normal),
                  ),
                child: const Padding(
                  padding:  EdgeInsets.all(10),
                  child:  Text("Voir google map"),
                )),
              ),
            )
          ]
        ),
      ),
    );
  }
}