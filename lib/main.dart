
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'pages/home_page.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  appBarTheme: AppBarTheme(color: cardColor),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}