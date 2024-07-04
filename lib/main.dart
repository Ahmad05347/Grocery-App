import 'package:flutter/material.dart';
import 'package:grocery_app/components/shop.dart';
import 'package:grocery_app/components/theme_data.dart';
import 'package:grocery_app/inner%20screens/feeds_screen.dart';
import 'package:grocery_app/inner%20screens/on_sale_screen.dart';
import 'package:grocery_app/pages/bottom_nav_bar.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    darkThemeChangeProvider.setDarkTheme =
        await darkThemeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return darkThemeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
              themeProvider.getDarkTheme,
              context,
            ),
            home: const BottomNavBar(),
            routes: {
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              FeedsScreen.routeName: (context) => const FeedsScreen(),
            },
          );
        },
      ),
    );
  }
}
