import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/fonts.dart';
import 'package:education_app/core/services/router.dart';
import 'package:education_app/src/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: Fonts.poppins,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Colors.transparent),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour)
        
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
