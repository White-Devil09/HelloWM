import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/firebase_options.dart';
import 'package:hellowm/pages/splash_screen.dart';
import 'package:hellowm/provider/google_signin.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:hellowm/provider/data_uploader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const HelloWM());
  // runApp(GetMaterialApp(home: DataUploadingPage(),));
}

class HelloWM extends StatelessWidget {
  const HelloWM({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context)=> GoogleSignInProvider(),
     child : GetMaterialApp(
      title: 'Hello WM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blueGrey,
      ),
      home: const SplashScreen(),
    ),
  );
}

// ignore: must_be_immutable
class DataUploadingPage extends StatelessWidget {
  DataUploadingPage({super.key});
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("Data is uploading"),
      ),
    );
  }
}