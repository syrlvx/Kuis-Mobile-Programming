import 'package:flutter/material.dart';
import 'dart:math';
import '../settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int likeCount = 0; // Counter untuk tombol Like
  String selectedButton = "None"; // Menunjukkan tombol mana yang diklik
  Color boxColor = Colors.blue; // Warna awal untuk kotak animasi

  void _changeBoxColor() {
    setState(() {
      // Mengubah warna secara acak
      boxColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Mobile Programming'),
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Text
            const Text(
              'Welcome to the Interactive App!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Decorative Divider
            Divider(color: Theme.of(context).primaryColor, thickness: 2),
            const SizedBox(height: 20),

            // Like Button Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Do you like this app?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          likeCount++;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'You liked this app! Total likes: $likeCount'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.thumb_up,
                          color: Colors
                              .white), // Menetapkan warna ikon menjadi putih
                      label: Text('Like ($likeCount)',
                          style: TextStyle(
                              color: Colors
                                  .white)), // Menetapkan warna label menjadi putih
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            boxColor, // Mengubah background menjadi warna yang dihasilkan
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Button Showcase with Selected State
            const Text(
              'Choose a Button:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = "Button 1";
                    });
                  },
                  child: const Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = "Button 2";
                    });
                  },
                  child: const Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = "Button 3";
                    });
                  },
                  child: const Text('Button 3'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'You selected: $selectedButton',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 30),

            // Navigation Button (Moved to the top)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 20),

            // Animated Color Box
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: _changeBoxColor,
                  child: const Text('Change Color'),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
