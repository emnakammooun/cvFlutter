import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv_23/emna/constants/colors.dart';
import 'package:cv_23/emna/provider/provider.dart';
import 'package:cv_23/emna/widgets/main.mobile.dart';
import 'package:cv_23/emna/widgets/projects.section.dart';
import '../widgets/drawer.mobile.dart';
import '../widgets/footer.dart';
import '../widgets/skills.mobile.dart';
import '../widgets/Education.dart';
import 'package:cv_23/emna/widgets/Experience.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    const double kMinDesktopWidth = 600.0;
    const double kMedDesktopWidth = 800.0;

    return Consumer<EmnaUiProvider>(
      builder: (context, EmnaUiProvider notifier, child) {
        final backgroundColor = notifier.isDark ? CustomColor.scaffoldBg : Colors.white;
        final textColor = notifier.isDark ? Colors.white : Colors.black;

        return WillPopScope(
          onWillPop: () async {
            // If the user is at the top of the page, pop the route
            if (scrollController.position.pixels <= scrollController.position.minScrollExtent) {
              Navigator.pop(context);
              return false; // Prevent default system behavior
            }
            return true; // Allow default system behavior
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                notifier.isEnglish ? "Mon portfolio" : "Mon portfolio",
                style: TextStyle(
                  color: textColor,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: textColor,
                ),
              ),
              actions: [
                DropdownButton<String>(
                  value: notifier.locale.languageCode,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      notifier.toggleLanguage(newValue);
                    }
                  },
                  items: <String>['en', 'fr']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(
                        value.toUpperCase(),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    );
                  }).toList(),
                  dropdownColor: backgroundColor, // Set the dropdown menu background color

                ),
              ],
              backgroundColor: backgroundColor,
            ),
            key: scaffoldKey,
            backgroundColor: backgroundColor,
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
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  color: backgroundColor,
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        notifier.isEnglish ? "What I can do" : "Ce que je peux faire",
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
                Container(
                  key: navbarKeys[2],
                  width: screenWidth,
                  color: backgroundColor,
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        notifier.isEnglish ? "Education" : "Études",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 50),
                      screenWidth >= kMedDesktopWidth ? const Education() : const Education(),
                    ],
                  ),
                ),
                Container(
                  key: navbarKeys[3],
                  width: screenWidth,
                  color: backgroundColor,
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        notifier.isEnglish ? "Experience" : "Expérience",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 50),
                      screenWidth >= kMedDesktopWidth ? const Experience() : const Experience(),
                    ],
                  ),
                ),
                ProjectsSection(key: navbarKeys[4]),
                const SizedBox(height: 30),
                const Footer(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                notifier.toggleDarkMode();
              },
              child: Icon(
                notifier.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    // No need to check scroll offset here. WillPopScope handles it.
  }
}
