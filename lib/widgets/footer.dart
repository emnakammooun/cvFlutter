import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import correct package for url launching
import '../constants/colors.dart';
import '../provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, uiProvider, _) {
        final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : CustomColor.scaffoldBg;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.maxFinite,
          alignment: Alignment.center,
          color: backgroundColor, // Change background color based on dark mode
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Youssef Koubaa - IIT',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textColor, // Change text color based on dark mode
                ),
              ),
              SizedBox(height: 12), // Space between text and logo
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      const url = 'https://github.com/youssefkoubaa/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset(
                      'assets/github.png',
                      width: 50,
                    ),
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
