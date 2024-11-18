import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.currentTheme.copyWith(
            textTheme: themeProvider.currentTheme.textTheme.apply(
              fontFamily: themeProvider.currentFontFamily,
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
