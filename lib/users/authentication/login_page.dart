// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_management/users/authentication/auth.dart';

import '../../screens/homepage.dart';
import '../../utils/my_button.dart';
import '../../utils/my_textfield.dart';
import 'loading.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool signedIn = false;
  String email = '';
  String password = '';
  String error = '';

  popMsg(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

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

  void signUserIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);

      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if (result == null) {
        Fluttertoast.showToast(msg: "Please check your email and password");

        setState(() {
          loading = false;
        });
      } else {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
            backgroundColor: const Color(0xFFAAD9FF),
            body: _LoginUi(context),
          ));
  }

  Widget _LoginUi(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                color: const Color(0xFF303F9F),
                Icons.business_center,
                size: 100,
              ),

              const SizedBox(height: 25),

              // welcome back, you've been missed!
              Text(
                'Welcome back!!',
                style: TextStyle(
                    color: const Color(0xFF303F9F),
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
                child: TextFormField(
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                  validator: (value) =>
                      value!.isEmpty ? popMsg('Email is required') : null,
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
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  textInputAction: TextInputAction.next,
                  // onSubmitted: _handleSubmitted,
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
                child: TextFormField(
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  validator: (value) =>
                      value!.isEmpty ? popMsg('Enter you password') : null,
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
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  textInputAction: TextInputAction.next,
                  // onSubmitted: _handleSubmitted,
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
                //anonymous method of sign in
                // onTapFunction: () async {
                //   dynamic result = await _auth.signInanon();
                //   if (result == null) {
                //     print("Error signing in");
                //   } else {
                //     print("signed in");
                //     print(email);
                //     print(password);
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => HomePage()));
                //   }
                // },
                onTapFunction: signUserIn,
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
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()))
                      // style: TextStyle(
                      //   color: Colors.blue,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
