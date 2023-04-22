import 'package:flutter/material.dart';
import 'package:library_management/screens/HomePage/Returned%20Books/returnbooklist.dart';
import 'package:library_management/screens/searchpage.dart';
import 'screens/homepage.dart';
import 'screens/splash_screen.dart';
import 'users/authentication/login_page.dart';
import 'users/authentication/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: HomePage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        HomePage.routeName: (context) => HomePage(),
        SearchPage.routeName: (context) => SearchPage(),
        // ReturnBookListPage.routeName:(context) => ReturnBookListPage(books: books)
      },
    );
  }
}
