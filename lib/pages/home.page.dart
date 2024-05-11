import 'package:flutter/material.dart';
import 'package:cv_23/constants/colors.dart';
import 'package:cv_23/constants/size.dart';
import 'package:cv_23/provider/provider.dart';
import 'package:cv_23/widgets/contact.section.dart';
import 'package:cv_23/widgets/main.mobile.dart';
import 'package:cv_23/widgets/projects.section.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.mobile.dart';
import '../widgets/footer.dart';
import '../widgets/skills.mobile.dart';
import '../widgets/Education.dart';
import 'package:cv_23/widgets/Experience.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(6, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Consumer<UiProvider>(
      builder: (context, UiProvider notifier, child) {
        final backgroundColor = notifier.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = notifier.isDark ? Colors.white : Colors.black;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Curriculuim Vitae"),
          ),
          key: scaffoldKey,
          backgroundColor: backgroundColor, // Use the updated background color here
          drawer: screenWidth < kMinDesktopWidth
              ? DrawerMobile(onNavItemTap: (int navIndex) {
            scaffoldKey.currentState?.openDrawer();
            scrollToSection(navIndex);
          })
              : null,

          body: ListView(
            controller: scrollController,
            children: [
              screenWidth >= kMinDesktopWidth ? const MainMobile() : const MainMobile(),
              const SizedBox(height: 50),

              // SKILLS
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                color: backgroundColor,
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Competences",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    screenWidth >= kMedDesktopWidth ? const SkillsMobile() : const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
                    // Education
               Container(
                key: navbarKeys[2],
                width: screenWidth,
                color: backgroundColor,
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Edcuation",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 50),
                    screenWidth >= kMedDesktopWidth ? const Education() : const Education(),
                  ],
                )),
                //Experience
                 Container(
                key: navbarKeys[3],
                width: screenWidth,
                color: backgroundColor,
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Experience",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 50),
                    screenWidth >= kMedDesktopWidth ? const Experience() : const Experience(),
                  ],
                )),
                  
              // PROJECTS
              ProjectsSection(key: navbarKeys[4]),
              const SizedBox(height: 30),
              // CONTACT
              ContactSection(key: navbarKeys[5]),
              // FOOTER
              const Footer(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<UiProvider>(context, listen: false).toggleDarkMode();
            },
            child: Icon(Icons.dark_mode),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

