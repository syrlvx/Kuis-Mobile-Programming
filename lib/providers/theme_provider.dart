import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  String _currentFontFamily = 'Roboto';

  ThemeData get currentTheme => _currentTheme;
  String get currentFontFamily => _currentFontFamily;

  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void setFont(String fontFamily) {
    _currentFontFamily = fontFamily;
    notifyListeners();
  }
}

// Theme Configuration
class AppThemes {
  static final ThemeData themeA = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
  );

  static final ThemeData themeB = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.lightGreen.shade100,
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    buttonTheme: ButtonThemeData(buttonColor: Colors.green),
  );

  static final ThemeData themeC = ThemeData(
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.purple.shade50,
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
    buttonTheme: ButtonThemeData(buttonColor: Colors.purple),
  );
}

// Font Configuration
class AppFonts {
  static final String fontA = GoogleFonts.roboto().fontFamily!;
  static final String fontB = GoogleFonts.lobster().fontFamily!;
  static final String fontC = GoogleFonts.poppins().fontFamily!;
}
