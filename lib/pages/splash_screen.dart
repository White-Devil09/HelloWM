import 'dart:async';
import 'package:flutter/material.dart';
import '../provider/controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4046), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ControllerPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "Hello WM!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 98, 158),
                    fontSize: 42,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "Are you busy?",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 26, 98, 158),
                    fontSize: 22,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            'assets/Images/splash.gif',
          ),
          const SizedBox(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 26, 98, 158),
            ),
          )
        ],
      ),
    );
  }
}
