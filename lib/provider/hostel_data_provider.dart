import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hellowm/model/hostel_model.dart';

class HostelDataProvider {
  final instance = FirebaseFirestore.instance;

  Stream<List<HostelModel>> getHostelList() {
    return instance
        .collection('hostelData')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((e) {
            return HostelModel.fromJson(
              e.data(),
            );
          }).toList(),
        );
  }
}
