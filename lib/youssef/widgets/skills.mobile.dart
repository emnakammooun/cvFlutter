import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Consumer<YoussefUiProvider>(
        builder: (context, uiProvider, _) {
          final backgroundColor =
          uiProvider.isDark ? CustomColor.bgLight2 : Colors.grey[200];
          final textColor = uiProvider.isDark ? Colors.white : Colors.black;

          return Column(
            children: [
              SizedBox(height: 0),
              _buildSkillItem('Angular', 0.8, textColor),
              _buildSkillItem('Laravel', 0.7, textColor),
              _buildSkillItem('Flutter', 0.9, textColor),
              _buildSkillItem('React Js', 0.8, textColor),
              _buildSkillItem('Django', 0.7, textColor),
              _buildSkillItem('Vue Js', 0.8, textColor),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSkillItem(String skillName, double skillLevel, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              skillName,
              style: TextStyle(fontSize: 20, color: textColor), // Set text color here
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                value: skillLevel,
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 180, 150, 190)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
