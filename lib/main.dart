import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv_23/youssef/provider/provider.dart';
import 'package:cv_23/emna/provider/provider.dart'; // Import the provider for Emna as well
import 'package:cv_23/youssef/pages/home.page.dart' as YoussefHomePage;
import 'package:cv_23/emna/pages/home.page.dart' as EmnaHomePage;
import 'package:cv_23/Acceuil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Use MultiProvider to provide both Youssef and Emna providers
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => YoussefUiProvider()..init()), // Youssef's provider
        ChangeNotifierProvider(create: (BuildContext context) => EmnaUiProvider()..init()), // Emna's provider
      ],
      child: Consumer<YoussefUiProvider>( // Use the Youssef provider for determining the theme
        builder: (context, YoussefUiProvider youssefNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AccueilPage(),
            routes: {
              '/homepage': (context) => YoussefHomePage.HomePage(),
              '/emna-homepage': (context) => EmnaHomePage.HomePage(),
              // Add other routes here if needed
            },
          );
        },
      ),
    );
  }
}
