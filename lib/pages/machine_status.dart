import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hellowm/pages/user_screen.dart';

class MachineStatusPage extends StatelessWidget {
  final String floorid;
  final bool busystats;
  MachineStatusPage(
      {super.key, required this.floorid, required this.busystats});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: busystats
          ? const Color.fromARGB(255, 233, 160, 185)
          : const Color.fromARGB(255, 187, 241, 189),
      child: Column(
        children: [
          AppBar(
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Text(
              floorid,
              style: const TextStyle(
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
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            busystats ? 'assets/Images/Busy.webp' : 'assets/Images/Free.webp',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Row(
              children: const [
                Text(
                  "Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text("data")
              ],
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
            ),
            onPressed: () {},
            label: const Text(
              " Add clothes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            icon: const FaIcon(
              FontAwesomeIcons.box,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
