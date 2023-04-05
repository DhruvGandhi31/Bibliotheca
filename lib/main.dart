// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/users/authentication/login_page.dart';
import 'screens/splash_screen.dart';
import 'users/authentication/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        // HomePage.routeName:(context) => HomePage(),
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //Initialize Firebase app
//   Future<FirebaseApp> _initialFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: _initialFirebase(),
//           builder: ((context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return LoginPage();
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           })),
//     );
//   }
// }
