import 'package:cloud_firestore/cloud_firestore.dart';

final fireStroe = FirebaseFirestore.instance;
final hostelRF = fireStroe.collection('hostelsData');

DocumentReference blockRF({
  required String? hostelid,
  required String? blockid,
})=> hostelRF.doc(hostelid).collection("Blocks").doc(blockid);

DocumentReference floorRF({
  required String? hostelid,
  required String? blockid,
  required String? floorid,
})=> hostelRF.doc(hostelid).collection("Blocks").doc(blockid).collection("Floors").doc(floorid);

