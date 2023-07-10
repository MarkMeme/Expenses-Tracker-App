import 'package:expense_tracker_app/screens/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => 

      */
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 51, 71));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.black),
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
