import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/pages/user_screen.dart';

class AddClothesPage extends StatefulWidget {
  const AddClothesPage({super.key});

  @override
  State<AddClothesPage> createState() => _AddClothesPageState();
}

class _AddClothesPageState extends State<AddClothesPage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _hour = 0,_minute = 59;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: const Text(
              'Add clothes',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                },
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$_hour'),
                Text('$_minute')
              ],
            ),
          )
        ],
      ),
    );
  }
}
