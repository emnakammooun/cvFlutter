import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../provider/provider.dart';
import '../constants/sns.links.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmnaUiProvider>(
      builder: (context, uiProvider, _) {
        final greyClairColor = Color(0xFFCCCCCC);
        final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : greyClairColor;
        final textColor = uiProvider.isDark ? Colors.white : CustomColor.scaffoldBg;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.maxFinite,
          alignment: Alignment.center,
          color: backgroundColor, // Change background color based on dark mode
          child: Column(
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Open GitHub profile
                      launch(SnsLinks.github);
                    },
                    child: Image.asset('assets/github.png', width: 28),
                  ),
                  InkWell(
                    onTap: () {
                      // Open LinkedIn profile
                      launch(SnsLinks.linkedIn);
                    },
                    child: Image.asset('assets/linkedin.png', width: 28),
                  ),
                  InkWell(
                    onTap: () {
                      // Open Facebook profile
                      launch(SnsLinks.facebook);
                    },
                    child: Image.asset('assets/facebook.png', width: 28),
                  ),
                  InkWell(
                    onTap: () {
                      // Open Instagram profile
                      launch(SnsLinks.instagram);
                    },
                    child: Image.asset('assets/instagram.png', width: 28),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Youssef Koubaa - IIT',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textColor, // Change text color based on dark mode
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
