import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/firebase_options.dart';
import 'package:hellowm/pages/splash_screen.dart';
import 'package:hellowm/provider/google_signin.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const HelloWM());
}

class HelloWM extends StatelessWidget {
  const HelloWM({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context)=> GoogleSignInProvider(),
     child : MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: const SplashScreen(),
    ),
  );
}
