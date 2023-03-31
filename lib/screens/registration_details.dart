import 'package:flutter/material.dart';
import 'package:hotel_management/screens/register.dart';

import '../utils/my_button.dart';
import '../utils/my_textfield.dart';
// import 'package:register_page/utils/my_textfield.dart';

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({Key? key}) : super(key: key);

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // logo
                const Icon(
                  Icons.app_registration,
                  size: 100,
                ),

                const SizedBox(height: 25),

                // welcome back, you've been missed!
                Text(
                  'Registration Details',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                MyTextField(
                  controller: usernameController,
                  hintText: 'Student ID',
                  obscureText: false,
                  sel_icon: const Icon(Icons.email),
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  obscureText: true,
                  sel_icon: const Icon(Icons.lock_open),
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  sel_icon: const Icon(Icons.lock),
                ),

                const SizedBox(height: 30),

                MyButton(
                  text: 'Register',
                  onTapFunction: () {
                    // Execute your custom function here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => regNow()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
