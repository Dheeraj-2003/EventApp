import 'package:event_hub/screens/home_screen.dart';
import 'package:event_hub/screens/intro_screen.dart';
import 'package:event_hub/screens/signup_screen.dart';
import 'package:event_hub/screens/splash_scree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData.light().copyWith(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 69, 163)),
  textTheme: GoogleFonts.ubuntuTextTheme().copyWith(),
);

final darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 98, 19, 19),
      brightness: Brightness.dark,
      onBackground: Colors.white),
  textTheme: GoogleFonts.ubuntuTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: darkTheme,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const IntroScreen();
          })),
    );
  }
}
