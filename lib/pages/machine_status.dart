import 'package:flutter/material.dart';

class MachineStatusPage extends StatelessWidget {
  final String floorid;
  const MachineStatusPage({super.key,required this.floorid});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("Welcome to machine status page"),
      ),
    );
  }
}
