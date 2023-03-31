import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api_connection/api_connection.dart';
import '../../model/user.dart';
import '../../utils/date_of_birth.dart';
import '../../utils/gender_dropdown.dart';
import '../../utils/my_button.dart';
import '../../utils/my_textfield.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String routeName = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // var formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final genderController = TextEditingController();
  // final DateTime dobController = ;
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final branchController = TextEditingController();
  final batchController = TextEditingController();
  final studentIDController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isAPIcallProcess = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': emailController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        //success connection api to server from flutter app
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(
              msg: "Email alreaady exists. Try another email");
        } else {
          //register & save new user record to database
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future registerAndSaveUserRecord() async {
    // User userModel = User(
    //   usernameController.text.trim(),
    //   // genderController.text,
    //   // DateOfBirthController,
    //   emailController.text,
    //   phoneNumberController.text,
    //   studentIDController.text,
    //   confirmPasswordController.text.trim(),
    // );

    try {
      // final uri = Uri.parse(API.signUp);
      // print(uri);
      // var url = "http://192.168.0.111/api_lib_manage/user/signup.php";
      var res = await http.post(
        Uri.parse(API.signUp),
        body: {
          "username": usernameController.text,
          "email": emailController.text,
          "phone_no": phoneNumberController.text,
          "student_id": studentIDController.text,
          "pswd": confirmPasswordController.text,
        },
      );
      // print(res);

      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        // Navigator.pop(context);

        if (resBodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(
              msg: "Congratulations!, you are signed up successfully.");
        } else {
          Fluttertoast.showToast(msg: "Error occurred in SignUp");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(children: [
              // const SizedBox(height: 20),

              // logo
              const Icon(
                Icons.app_registration,
                size: 100,
              ),
              Text(
                'New User Registration',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(height: 20),

                      // // logo
                      // const Icon(
                      //   Icons.app_registration,
                      //   size: 100,
                      // ),

                      const SizedBox(height: 20),

                      // welcome back, you've been missed!

                      const SizedBox(height: 30),

                      // username textfield
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Full Name',
                        obscureText: false,
                        sel_icon: const Icon(Icons.account_circle_outlined),
                      ),

                      const SizedBox(height: 15),
                      // password textfield

                      GenderPicker(
                        onGenderSelected: (value) {
                          // Handle the selected gender
                        },
                      ),

                      const SizedBox(height: 15),

                      DateOfBirthPicker(
                        onDateSelected: (value) {
                          // Handle the selected date
                        },
                      ),

                      const SizedBox(height: 15),

                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        sel_icon: const Icon(Icons.email_outlined),
                      ),

                      const SizedBox(height: 15),

                      MyTextField(
                        controller: phoneNumberController,
                        hintText: 'Phone Number',
                        obscureText: false,
                        sel_icon: const Icon(Icons.phone_outlined),
                      ),

                      const SizedBox(height: 15),

                      MyTextField(
                        controller: studentIDController,
                        hintText: 'Student ID',
                        obscureText: false,
                        sel_icon: const Icon(Icons.email),
                      ),
                      const SizedBox(height: 15),

                      MyTextField(
                        controller: passwordController,
                        hintText: 'Enter your Password',
                        obscureText: true,
                        sel_icon: const Icon(Icons.lock_open),
                      ),

                      const SizedBox(height: 15),

                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                        sel_icon: const Icon(Icons.lock),
                      ),

                      // const SizedBox(height: 30),

                      // const SizedBox(height: 20),

                      // MyButton(
                      //   text: 'Next',
                      //   onTapFunction: () {
                      //     // Execute your custom function here
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => RegistrationDetails(
                      //               usernameController,
                      //               genderController,
                      //               emailController,
                      //               phoneNumberController,
                      //               branchController,
                      //               batchController)),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyButton(
                text: 'Register',
                onTapFunction: validateUserEmail,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}