import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose Theme:', style: TextStyle(fontSize: 18)),
            ListTile(
              title: const Text('Theme A'),
              leading: Radio(
                value: AppThemes.themeA,
                groupValue: themeProvider.currentTheme,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                },
              ),
            ),
            ListTile(
              title: const Text('Theme B'),
              leading: Radio(
                value: AppThemes.themeB,
                groupValue: themeProvider.currentTheme,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                },
              ),
            ),
            ListTile(
              title: const Text('Theme C'),
              leading: Radio(
                value: AppThemes.themeC,
                groupValue: themeProvider.currentTheme,
                onChanged: (value) {
                  themeProvider.setTheme(value!);
                },
              ),
            ),
            const Divider(),
            const Text('Choose Font:', style: TextStyle(fontSize: 18)),
            ListTile(
              title: const Text('Roboto'),
              leading: Radio(
                value: AppFonts.fontA,
                groupValue: themeProvider.currentFontFamily,
                onChanged: (value) {
                  themeProvider.setFont(value!);
                },
              ),
            ),
            ListTile(
              title: const Text('Lobster'),
              leading: Radio(
                value: AppFonts.fontB,
                groupValue: themeProvider.currentFontFamily,
                onChanged: (value) {
                  themeProvider.setFont(value!);
                },
              ),
            ),
            ListTile(
              title: const Text('Poppins'),
              leading: Radio(
                value: AppFonts.fontC,
                groupValue: themeProvider.currentFontFamily,
                onChanged: (value) {
                  themeProvider.setFont(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
