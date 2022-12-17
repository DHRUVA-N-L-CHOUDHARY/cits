import 'package:cits_assignment/controllers/auth_controller.dart';
import 'package:cits_assignment/controllers/login_controller.dart';
import 'package:cits_assignment/utils/constants/Colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utils/widgets/Custom_button.dart';
import '../utils/widgets/Custom_input_field.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: controller.loginformKey,
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
                            "Login in to Get started",
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
                          labelText: 'Password',
                          hintText: 'Password',
                          icondata: Icons.lock,
                          maxLine: 1,
                          suffixWidget: InkWell(
                            onTap: () {
                              controller.setSecureUnSecure();
                            },
                            child: const ImageIcon(
                              AssetImage(
                                  "lib/config/Icon ionic-ios-lock..png"),
                            ),
                          ),
                          controller: controller.passwordController,
                          // option: true,
                          isSecure: controller.isSecure,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const TextButton(
                                onPressed: null,
                                child: Text(
                                  "Use Mobile Number",
                                  style: TextStyle(color: kPrimaryColor),
                                ))
                          ],
                        ),
                        Center(
                            child: RichText(
                          // ignore: prefer_const_constructors
                          text: TextSpan(
                            text: 'Don\'t an account?',
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Register!',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Get.offAllNamed("/registration");
                                    }),
                            ],
                          ),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomSheet: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                        text: "Log in",
                        margins: 5.0,
                        press: () {
                          // Get.toNamed("/dashboard");
                          controller.signInWithEmailAndPassword();
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
