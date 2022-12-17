import 'package:cits_assignment/views/product_page_view.dart';
import 'package:cits_assignment/views/registration_page_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<Widget> _login() async {
      if(FirebaseAuth.instance.currentUser != null) {
        QuerySnapshot _querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get();
        if(_querySnapshot.docs.isEmpty) {
        return RegistrationView();
        } else {
          // return DashboardPageView();
          return ProductPage();
        }
      } else {
        return LoginView();
      }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: _login(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(body: snapshot.data ?? const CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text(
                "Error: $error",
              ),
            );
          } else {
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          }
        });
  }
}
