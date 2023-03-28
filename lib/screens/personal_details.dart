import 'package:flutter/material.dart';
import 'registration_details.dart';
import '../utils/date_of_birth.dart';
import '../utils/gender_dropdown.dart';
import '../utils/my_button.dart';
import '../utils/my_textfield.dart';

class PersonalDetails extends StatefulWidget {
  static String routeName = 'LoginPage';

  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final branchController = TextEditingController();
  final batchController = TextEditingController();

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
                  'New User Registration',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // username textfield
                MyTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  obscureText: false,
                  sel_icon: const Icon(Icons.account_circle_outlined),
                ),

                const SizedBox(height: 10),
                // password textfield

                GenderPicker(
                  onGenderSelected: (value) {
                    // Handle the selected gender
                  },
                ),

                const SizedBox(height: 10),

                DateOfBirthPicker(
                  onDateSelected: (value) {
                    // Handle the selected date
                  },
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  sel_icon: const Icon(Icons.email_outlined),
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  sel_icon: const Icon(Icons.phone_outlined),
                ),

                const SizedBox(height: 50),

                MyButton(
                  text: 'Next',
                  onTapFunction: () {
                    // Execute your custom function here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationDetails()),
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
