import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/pages/floor_screen.dart';
import 'package:hellowm/pages/user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference _blocks = FirebaseFirestore.instance
      .collection("hostelsData")
      .doc("IITH")
      .collection("Blocks");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey,
                    Color.fromARGB(255, 132, 174, 207),
                    Color.fromARGB(255, 223, 103, 143),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text(
                "Hello WM",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                InkWell(
                  child: Padding(
                    padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.05),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                  ),
                  onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const UserPage()),
                          );
                        },
                )
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.14,
              right: MediaQuery.of(context).size.width * 0.2,
              left: MediaQuery.of(context).size.width * 0.12,
              child: Text(
                "Welcome,\n${user.displayName},\nHave a good laundry.",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.29,
              right: MediaQuery.of(context).size.width * 0.25,
              left: MediaQuery.of(context).size.width * 0.25,
              child: const Text(
                "Hostel Blocks",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    fontSize: 27),
              ),
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: _blocks.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, idx) {
                    final DocumentSnapshot blockdata = snapshot.data!.docs[idx];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                        bottom: 10,
                      ),
                      child: ListTile(
                        minVerticalPadding: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        tileColor: Colors.blue,
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            blockdata["Hostel-ID"][0],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FloorPage(
                                    blockname: blockdata['Block'],
                                    block: blockdata['Hostel-ID'])),
                          );
                        },
                        title: Text(
                          blockdata['Block'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                        trailing: Chip(
                          backgroundColor: Colors.blueGrey,
                          label: Text(
                            "${blockdata['floor_count']} Machines",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Material(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const SizedBox(
                      child: Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 26, 98, 158),
                              fontSize: 42,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Image.asset(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.32,
                      'assets/Images/splash.gif',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const SizedBox(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 26, 98, 158),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
