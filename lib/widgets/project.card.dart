import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher for launching URLs
import 'package:cv_23/utils/project.utils.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../provider/provider.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, UiProvider uiProvider, child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.bgLight2 : Colors.grey[200];
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;
        final textColor2 = uiProvider.isDark ? CustomColor.bgLight1 : Colors.grey[400];

        return Container(
          clipBehavior: Clip.antiAlias,
          height: 290,
          width: 260,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Project image
              Image.asset(project.image, height: 140, width: 260, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                child: Text(
                  project.title,
                  style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
                ),
              ),
              // Subtitle
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(
                  project.subtitle,
                  style: TextStyle(fontSize: 12, color: textColor),
                ),
              ),
              const Spacer(),
              // Footer
              Container(
                color: textColor2,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      'Available on',
                      style: TextStyle(color: CustomColor.yellowSecondary, fontSize: 10),
                    ),
                    const Spacer(),
                    if (project.webLink != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: InkWell(
                          onTap: () {
                            _launchURL(project.webLink!);
                          },
                          child: Image.asset('assets/web_icon.jpg', width: 17),
                        ),
                        
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
