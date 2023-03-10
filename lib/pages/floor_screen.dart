import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellowm/pages/machine_status.dart';
import 'package:hellowm/pages/user_screen.dart';

class FloorPage extends StatefulWidget {
  final String blockname;
  final String block;
  const FloorPage({super.key, required this.blockname, required this.block});

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
    final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final CollectionReference floors = FirebaseFirestore.instance
        .collection("hostelsData")
        .doc("IITH")
        .collection("Blocks")
        .doc(widget.block)
        .collection("Floors");

    return Material(
      child: Column(children: [
        AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey,
                  Color.fromARGB(255, 132, 174, 207),
                  Color.fromARGB(255, 223, 103, 143),
                ],
              ),
            ),
          ),
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Text(
            widget.blockname,
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
                  MaterialPageRoute(builder: (context) =>  UserPage()),
                );
              },
            )
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: floors.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, idx) {
                    final DocumentSnapshot floordata = snapshot.data!.docs[idx];
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MachineStatusPage(
                                  floorid: floordata["Floor"]),
                            ),
                          );
                        },
                        title: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          child: Text(
                            floordata["Floor"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                        trailing: Chip(
                          backgroundColor: floordata["Busy Status"]
                              ? Colors.red
                              : Colors.green,
                          label: Text(
                            floordata["Busy Status"] ? "Busy" : "Free",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          labelPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
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
                      height: MediaQuery.of(context).size.height * 0.1,
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
                      height: MediaQuery.of(context).size.height * 0.45,
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
