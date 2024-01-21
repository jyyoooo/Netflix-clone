import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/view/auth/login_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: backgroundcolor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),),
      home: const LoginPage(),
    );
  }
}
