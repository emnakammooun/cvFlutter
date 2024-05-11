import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../constants/education.items.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<EmnaUiProvider>(
      builder: (context, EmnaUiProvider uiProvider, child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : const Color.fromARGB(255, 224, 202, 228);
        String currentLanguage = uiProvider.locale.languageCode; // Get current language

        return Column(
          children: [
            for (int i = 0; i < educationItems.length; i++)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 150, 190)
                  , // Background color of the container
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15), // Padding around ListTile content
                  child: ListTile(
                    contentPadding: EdgeInsets.zero, // Remove default ListTile padding
                    //leading: Image.asset(experienceItems[i]['img'], width: 26),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          educationItems[i]['title'][currentLanguage]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 5), // Add spacing between title and university
                        Text(
                          educationItems[i]['university'][currentLanguage]!,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 1), // Add spacing between university and year
                        Text(
                          educationItems[i]['year'],
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
  
      


      
  


