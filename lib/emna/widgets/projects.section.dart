import 'package:flutter/material.dart';
import 'package:cv_23/emna/widgets/project.card.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../utils/project.utils.dart';
import '../provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<EmnaUiProvider>(
      builder: (context, EmnaUiProvider uiProvider , child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;

        return Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: backgroundColor, // Set background color
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // work projects title
              Text(
                uiProvider.isEnglish
                    ? "Academic Projects"
                    :  "Projets Academiques",

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Set text color
                ),
              ),

              const SizedBox(height: 50),
              // work project cards
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    for (int i = 0; i < workProjectUtils.length; i++)
                      ProjectCardWidget(
                        project: workProjectUtils[i],
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
}
