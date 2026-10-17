import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MovieLibraryApp());
}

class MovieLibraryApp extends StatelessWidget {
  const MovieLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.amber.shade700,
          surface: const Color(0xFF1E1E24),
          surfaceContainerHighest: const Color(0xFF2B2B36),
        ),
        scaffoldBackgroundColor: const Color(0xFF121216),
        cardColor: const Color(0xFF1E1E24),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF121216),
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
