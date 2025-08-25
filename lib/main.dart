import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/fonts.dart';
import 'package:education_app/core/services/injection_container.dart';

import 'package:education_app/core/services/router.dart';
import 'package:education_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) { 
        return UserProvider();
       },
      child: MaterialApp(
        title: 'Education App',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: Fonts.poppins,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(color: Colors.transparent),
          colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour)
          
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
