import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/pages/loading_screen.dart';
import 'package:hellowm/pages/login_screen.dart';
import '../pages/home_screen.dart';

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Center(
                child: Text("Something went wrong"),
              ),
            );
          }else{
          return const LoginPage();
          }
        },
      ),
    );
  }
}
