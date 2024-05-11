import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../provider/provider.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context); // Assuming UiProvider is accessible here
    final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
    final textColor = uiProvider.isDark ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150, // specify the height
        width: 150, // specify the width
        color: backgroundColor,
        child: Image.asset(
          'assets/iit_logo.png',
          color: textColor,
          colorBlendMode: BlendMode.dst,
        ),
      ),
    );
  }
}
