import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher for launching URLs
import 'package:cv_23/youssef/utils/project.utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
    return Consumer<YoussefUiProvider>(
      builder: (context, YoussefUiProvider uiProvider, child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.bgLight2 : Colors.grey[200];
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;
        final textColor2 = uiProvider.isDark ? CustomColor.bgLight1 : Colors.grey[400];
        String currentLanguage = uiProvider.locale.languageCode; // Get current language

        return Container(
          clipBehavior: Clip.antiAlias,
          height: 290,
          width: 260,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 180, 150, 190),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Project image
              Image.asset(project.image, height: 290, width: 140, fit: BoxFit.cover),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title[currentLanguage]!, // Get title based on language
                        style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
                      ),
                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                        child: Text(
                          project.subtitle[currentLanguage]!, // Get subtitle based on language
                          style: TextStyle(fontSize: 12, color: textColor),
                        ),
                      ),
                      const Spacer(),
                      // Clickable text to open website
                      InkWell(
                        onTap: () {
                          if (project.webLink != null) {
                            _launchURL(project.webLink!);
                          }
                        },
                        child: Text(
                          uiProvider.isEnglish
                              ? 'Click here to open the website'
                              : 'Click ici pour ouvrir le site web',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
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
