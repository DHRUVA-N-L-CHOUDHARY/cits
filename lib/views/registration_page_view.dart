// ignore_for_file: prefer_const_constructors

import 'package:cits_assignment/controllers/login_controller.dart';
import 'package:cits_assignment/controllers/registration_controller.dart';
import 'package:cits_assignment/utils/constants/Colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utils/widgets/Custom_button.dart';
import '../utils/widgets/Custom_input_field.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: controller.registrationformKey,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Register in to Get started",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Experience the all new App!",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InputTextwidget(
                            hintText: "Name",
                            labelText: 'Name',
                            icondata: Icons.person_outline_rounded,
                            controller: controller.nameController,
                            emptyValidation: false,
                            validation: (value) {
                              if (value == "") {
                                return "Enter the text in the field";
                              } else {
                                return null;
                              }
                            }
                            // option: true,
                            ),
                        InputTextwidget(
                            hintText: "E-mail ID",
                            labelText: 'E-mail ID',
                            icondata: Icons.email_outlined,
                            controller: controller.emailController,
                            emptyValidation: false,
                            validation: (value) {
                              if (value == "" || !GetUtils.isEmail(value)) {
                                return "Email is not valid";
                              } else {
                                return null;
                              }
                            }
                            // option: true,
                            ),
                        InputTextwidget(
                            hintText: "Mobile Number",
                            labelText: 'Mobile Number',
                            icondata: Icons.phone,
                            controller: controller.mobileController,
                            emptyValidation: false,
                            validation: (value) {
                              if (value == "" || !GetUtils.isEmail(value)) {
                                return "Email is not valid";
                              } else {
                                return null;
                              }
                            }
                            // option: true,
                            ),
                        InputTextwidget(
                          labelText: 'Password',
                          hintText: 'Password',
                          icondata: Icons.lock,
                          maxLine: 1,
                          suffixWidget: InkWell(
                            onTap: () {
                              controller.setSecureUnSecure();
                            },
                            child: ImageIcon(
                              const AssetImage(
                                  "lib/config/Icon ionic-ios-lock.png"),
                            ),
                          ),
                          controller: controller.passwordController,
                          // option: true,
                          isSecure: controller.isSecure,
                        ),
                        InputTextwidget(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          icondata: Icons.lock,
                          maxLine: 1,
                          suffixWidget: InkWell(
                            onTap: () {
                              controller.setSecureUnSecure();
                            },
                            child: ImageIcon(
                              const AssetImage(
                                  "lib/config/Icon ionic-ios-lock.png"),
                            ),
                          ),
                          controller: controller.confirmpasswordController,
                          // option: true,
                          isSecure: controller.isSecure,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultButton(
                            text: "REGISTER",
                            margins: 5.0,
                            press: () {
                              // Get.toNamed("/dashboard");
                              controller.signUpWithEmailAndPassword();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: RichText(
                          // ignore: prefer_const_constructors
                          text: TextSpan(
                            text: 'Already having an account?',
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Get.offAllNamed("/login");
                                    }),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
