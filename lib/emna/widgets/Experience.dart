import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/experience.items.dart'; // Importez le fichier correct pour les éléments d'expérience
class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool isDescriptionVisible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmnaUiProvider>(
      builder: (context, uiProvider, child) {
        final backgroundColor =
        uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;
        String currentLanguage = uiProvider.locale.languageCode; // Get current language

        return Column(
          children: [
            for (int i = 0; i < experienceItems.length; i++)
              Container(
                padding: EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 180, 150, 190)
                  ,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.work,
                        color: Color.fromARGB(255, 148, 95, 156),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing between icon and text

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experienceItems[i]['title'][currentLanguage]!,
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            experienceItems[i]['company'],
                            style: TextStyle(
                              fontSize: 19,
                              color: textColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '${experienceItems[i]['startDate'][currentLanguage]} - ${experienceItems[i]['endDate'][currentLanguage]}' ??
                                '',
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          isDescriptionVisible
                              ? Text(
                            experienceItems[i]['description'][currentLanguage]!,
                            style: TextStyle(
                              fontSize: 18,
                              color: textColor,
                            ),
                          )
                              : Container(), // Hidden initially
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDescriptionVisible = !isDescriptionVisible;
                        });
                      },
                      child: Icon(
                        isDescriptionVisible
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: textColor,
                      ),
                    ),
                    // Arrow icon to toggle description visibility
                    GestureDetector(
                      onTap: () {
                        launch(experienceItems[i]['linkedinUrl']);
                      },
                      child: Image.asset(
                        'assets/linkedin.png',
                        width: 28,
                      ),
                    ),


                    // Company Logo


                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
