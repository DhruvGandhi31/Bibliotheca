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

import 'auth.dart';

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

  String username = '';
  String email = '';
  String phone_no = '';
  String student_id = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  bool isAPIcallProcess = false;
  bool hidePassword = true;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  // validateUserEmail() async {
  //   try {
  //     var res = await http.post(
  //       Uri.parse(API.validateEmail),
  //       body: {
  //         'email': emailController.text.trim(),
  //       },
  //     );

  //     if (res.statusCode == 200) {
  //       //success connection api to server from flutter app
  //       var resBodyOfValidateEmail = jsonDecode(res.body);

  //       if (resBodyOfValidateEmail['emailFound'] == true) {
  //         Fluttertoast.showToast(
  //             msg: "Email alreaady exists. Try another email");
  //       } else {
  //         //register & save new user record to database
  //         registerAndSaveUserRecord();
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

  // Future registerAndSaveUserRecord() async {
  //   // User userModel = User(
  //   //   usernameController.text.trim(),
  //   //   // genderController.text,
  //   //   // DateOfBirthController,
  //   //   emailController.text,
  //   //   phoneNumberController.text,
  //   //   studentIDController.text,
  //   //   confirmPasswordController.text.trim(),
  //   // );

  //   try {
  //     // final uri = Uri.parse(API.signUp);
  //     // print(uri);
  //     // var url = "http://192.168.0.111/api_lib_manage/user/signup.php";
  //     var res = await http.post(
  //       Uri.parse(API.signUp),
  //       body: {
  //         "username": usernameController.text,
  //         "email": emailController.text,
  //         "phone_no": phoneNumberController.text,
  //         "student_id": studentIDController.text,
  //         "pswd": confirmPasswordController.text,
  //       },
  //     );
  //     // print(res);

  //     if (res.statusCode == 200) {
  //       var resBodyOfSignUp = jsonDecode(res.body);
  //       // Navigator.pop(context);

  //       if (resBodyOfSignUp['success'] == true) {
  //         Fluttertoast.showToast(
  //             msg: "Congratulations!, you are signed up successfully.");
  //       } else {
  //         Fluttertoast.showToast(msg: "Error occurred in SignUp");
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

  register_user() async {
    if (password == confirmPassword) {
      if (_formKey.currentState!.validate()) {
        print(email);
        print(password);

        dynamic result =
            await _auth.registerWithEmailAndPassword(email, password);
        if (result == null) {
          Fluttertoast.showToast(msg: "Poblem occured during signup");
        } else {
          Fluttertoast.showToast(msg: "Congratulations! you are registered");
          Navigator.of(context).pop();
        }
      }
    } else {
      Fluttertoast.showToast(msg: "passwords do not match");
    }
  }

  popMsg(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAD9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(children: [
                // const SizedBox(height: 20),

                // logo
                const Icon(
                  color: Color(0xFF303F9F),
                  Icons.app_registration,
                  size: 100,
                ),
                Text(
                  'New User Registration',
                  style: TextStyle(
                      color: Color(0xFF303F9F),
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

                        // welcome back, you've been missed!

                        const SizedBox(height: 30),

                        // username textfield
                        // MyTextField(
                        //   controller: usernameController,
                        //   hintText: 'Full Name',
                        //   obscureText: false,
                        //   sel_icon: const Icon(Icons.account_circle_outlined),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => username = value);
                            },
                            controller: usernameController,
                            validator: (value) => value!.isEmpty
                                ? popMsg('Full name is required')
                                : null,
                            // focusNode: _focusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon:
                                  const Icon(Icons.account_circle_outlined),
                              hintText: 'Full Name',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
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

                        // MyTextField(
                        //   controller: emailController,
                        //   hintText: 'Email',
                        //   obscureText: false,
                        //   sel_icon: const Icon(Icons.email_outlined),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                            validator: (value) => value!.isEmpty
                                ? popMsg('Email is required')
                                : null,
                            controller: emailController,
                            // focusNode: _focusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // MyTextField(
                        //   controller: phoneNumberController,
                        //   hintText: 'Phone Number',
                        //   obscureText: false,
                        //   sel_icon: const Icon(Icons.phone_outlined),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => phone_no = value);
                            },
                            controller: phoneNumberController,
                            validator: (value) => value!.isEmpty
                                ? popMsg('Please enter your phone no. properly')
                                : null,
                            // focusNode: _focusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.phone_outlined),
                              hintText: 'Phone Number',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // MyTextField(
                        //   controller: studentIDController,
                        //   hintText: 'Student ID',
                        //   obscureText: false,
                        //   sel_icon: const Icon(Icons.email),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => student_id = value);
                            },
                            validator: (value) => value!.isEmpty
                                ? popMsg('student ID is required')
                                : null,
                            controller: studentIDController,
                            // focusNode: _focusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Student ID',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
                        ),
                        const SizedBox(height: 15),

                        // MyTextField(
                        //   controller: passwordController,
                        //   hintText: 'Enter your Password',
                        //   obscureText: true,
                        //   sel_icon: const Icon(Icons.lock_open),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                            validator: (value) => value!.isEmpty ||
                                    (value.length < 8)
                                ? popMsg('Please enter your password properly')
                                : null,
                            controller: passwordController,
                            // focusNode: _focusNode,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.lock_open),
                              hintText: 'Enter your Password',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // MyTextField(
                        //   controller: confirmPasswordController,
                        //   hintText: 'Confirm Password',
                        //   obscureText: true,
                        //   sel_icon: const Icon(Icons.lock),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.875,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() => confirmPassword = value);
                            },
                            validator: (value) => value!.isEmpty ||
                                    (value.length < 8)
                                ? popMsg('Please enter your password properly')
                                : null,
                            controller: confirmPasswordController,
                            // focusNode: _focusNode,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            textInputAction: TextInputAction.next,
                            // onSubmitted: _handleSubmitted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Register',
                  onTapFunction: register_user,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
