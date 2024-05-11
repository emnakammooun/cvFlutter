import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import correct package for url launching
import '../constants/colors.dart';
import '../provider/provider.dart';
import 'package:provider/provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, uiProvider, child) {
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;
        final backgroundColor =
            uiProvider.isDark ? CustomColor.scaffoldBg : Colors.grey[200];

        return Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: backgroundColor,
          child: Column(
            children: [
              // Title
              Text(
                'Contactez Moi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Divider(),
              ),
              const SizedBox(height: 15),

              // LinkedIn and WhatsApp icons with spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      const url = 'https://www.linkedin.com/search/results/all/?fetchDeterministicClustersOnly=true&heroEntityKey=urn%3Ali%3Afsd_profile%3AACoAAD8RYW8Bb2xa_0j4UyzaSmQOsbiXjHtNbq4&keywords=youssef%20koubaa&origin=RICH_QUERY_TYPEAHEAD_HISTORY&position=0&searchId=86e4a661-5349-47f1-a75e-6a62ea09936c&sid=co%40&spellCorrectionEnabled=true';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset('assets/linkedin.png', width: 40),
                  ),
                  const SizedBox(width: 20), // Adjust the width as needed for spacing
                  InkWell(
                    onTap: () async {
                      const url = 'https://wa.me/95752615';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset('assets/whatsapp.png', width: 40),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
