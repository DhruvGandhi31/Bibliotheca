// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_management/users/authentication/auth.dart';

import '../../screens/homepage.dart';
import '../../utils/my_button.dart';
import '../../utils/my_textfield.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  bool signedIn = false;

  //imported from mytexfield.dart
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmitted(String value) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.nextFocus();
    }
  }
  //end

  void signUserIn() {}
  // sign user in method
  // static Future<User?> signUserIn(
  //     {required String email,
  //     required String psswd,
  //     required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;

  //   try {
  //     UserCredential userCredential =
  //         await auth.signInWithEmailAndPassword(email: email, password: psswd);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found with this email');
  //     }
  //   }

  //   return user;
  // }
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: _LoginUi(context),
    ));
  }

  Widget _LoginUi(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

          // logo
          const Icon(
            Icons.business_center,
            size: 100,
          ),

          const SizedBox(height: 25),

          // welcome back, you've been missed!
          Text(
            'Welcome back!!',
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          // username textfield
          // MyTextField(
          //   controller: usernameController,
          //   hintText: 'Email',
          //   obscureText: false,
          //   sel_icon: const Icon(Icons.account_circle_outlined),
          //   textInputAction: TextInputAction.next,
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.875,
            child: TextField(
              onChanged: (value) {
                setState(() => email = value);
              },
              controller: usernameController,
              // focusNode: _focusNode,
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(Icons.account_circle_outlined),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: _handleSubmitted,
            ),
          ),

          const SizedBox(height: 10),

          // password textfield
          // MyTextField(
          //   controller: passwordController,
          //   hintText: 'Password',
          //   obscureText: true,
          //   sel_icon: const Icon(Icons.lock),
          //   textInputAction: TextInputAction.next,
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.875,
            child: TextField(
              onChanged: (value) {
                setState(() => password = value);
              },
              controller: passwordController,
              // focusNode: _focusNode,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: _handleSubmitted,
            ),
          ),

          const SizedBox(height: 10),

          // forgot password?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          MyButton(
            text: 'Sign In',
            // onTapFunction: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()))
            onTapFunction: () async {
              dynamic result = await _auth.signInanon();
              if (result == null) {
                print("Error signing in");
              } else {
                print("signed in");
                print(email);
                print(password);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
          ),

          // const SizedBox(height: 50),

          // or continue with
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Divider(
          //           thickness: 0.5,
          //           color: Colors.grey[400],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //         child: Text(
          //           'Or continue with',
          //           style: TextStyle(color: Colors.grey[700]),
          //         ),
          //       ),
          //       Expanded(
          //         child: Divider(
          //           thickness: 0.5,
          //           color: Colors.grey[400],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 40),

          // // google sign in buttons
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     // google button
          //     SquareTile(imagePath: 'assets/images/google.png'),

          //     // SizedBox(width: 25),
          //   ],
          // ),

          const SizedBox(height: 20),

          // not a member? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(width: 4),
              TextButton(
                  child: const Text('Register now'),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()))
                  // style: TextStyle(
                  //   color: Colors.blue,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  ),
            ],
          )
        ],
      ),
    );
  }
}
