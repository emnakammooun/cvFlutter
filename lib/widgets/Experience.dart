import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
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
    return Consumer<UiProvider>(
      builder: (context, uiProvider, child) {
        final backgroundColor =
            uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;

        return Column(
          children: [
            for (int i = 0; i < experienceItems.length; i++)
              Container(
                padding: EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 134, 103, 139),
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
                            experienceItems[i]['title'] as String,
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            experienceItems[i]['company'] as String,
                            style: TextStyle(
                              fontSize: 19,
                              color: textColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '${experienceItems[i]['startDate']} - ${experienceItems[i]['endDate']}' ??
                                '',
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          isDescriptionVisible
                              ? Text(
                                  experienceItems[i]['description'] as String,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: textColor,
                                  ),
                                )
                              : Container(), // Hidden initially
                        ],
                      ),
                    ),
                    // Arrow icon to toggle description visibility
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
                        color: Colors.grey,
                      ),
                    ),
                    // Company Logo
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        experienceItems[i]['logo'] as String,
                        width: 50, // Adjust size as needed
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
