import 'package:expense_tracker_app/screens/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 29, 51, 71));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme(color: Color.fromARGB(180, 29, 51, 71)),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.onPrimaryContainer,
              foregroundColor: kDarkColorScheme.primaryContainer,
              actionsIconTheme:
                  IconThemeData(color: kDarkColorScheme.onPrimary)),
          useMaterial3: true),
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
              actionsIconTheme: IconThemeData(color: kColorScheme.onPrimary)),
          useMaterial3: true),
      home: const ExpensesScreen(),
    );
  }
}
