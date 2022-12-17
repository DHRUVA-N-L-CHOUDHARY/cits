import 'package:cits_assignment/main.dart';
import 'package:cits_assignment/services/auth.dart';
import 'package:cits_assignment/views/product_page_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets/custom_loading.dart';

class RegistrationController extends GetxController {
  final registrationformKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController sponsoridController = TextEditingController();
  TextEditingController sponsornameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  bool isSecure = true;
  bool move = false;

  @override
  void onInit() {
    super.onInit();
    // PreferenceUtils.init();
  }

  setSecureUnSecure() {
    isSecure = !isSecure;
    update();
  }

  signUpWithEmailAndPassword() async {
    if (registrationformKey.currentState!.validate()) {
      Get.focusScope?.unfocus();
      showLoader(Get.context);
      await authService
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((result) async {
        Get.back();
        if (result != null) {
          if (kDebugMode) {
            print("result : $result");
          }
          Get.offAll(const ProductPage());
        }
      });
    }
  }
}
