import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Consumer<UiProvider>(
      builder: (context, uiProvider, _) {
        final textColor = uiProvider.isDark ? CustomColor.whitePrimary : Colors.black;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          height: screenHeight,
          constraints: const BoxConstraints(minHeight: 500),
          color: uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Circular profile image
              CircleAvatar(
                radius: screenWidth * 0.3, // Adjust the radius of the circle (e.g., 20% of screen width)
                backgroundImage: AssetImage('assets/youssef.png'),
              ),
              const SizedBox(height: 200),
              Text(
                "Youssef Koubaa\nEleve Ingenieur Informatique",
                textAlign: TextAlign.center, // Center align the text
                style: TextStyle(
                  fontSize: 20,
                  height: 2,
                  fontWeight: FontWeight.normal,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 200),
             
            ],
          ),
        );
      },
    );
  }
}
