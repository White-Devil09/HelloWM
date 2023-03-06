import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hellowm/model/hostel_model.dart';
import 'package:hellowm/provider/references.dart';

class DataUploader extends GetxController{

  @override
  void onReady(){
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String,dynamic> manifestMap = json.decode(manifestContent);
    final hostelLst = manifestMap.keys.where((path) => path.startsWith("assets/hostel") && path.contains(".json")).toList();

    List<HostelModel> hostelsData = [];

    for(var item in hostelLst){
      String hostelContent = await rootBundle.loadString(item);
      hostelsData.add(HostelModel.fromJson(json.decode(hostelContent))); 
    }
    var batch = firestore.batch();

    for(var hstl in hostelsData){
      batch.set( hostelRF.doc(hstl.id), {
        "blocks_count":hstl.hostels==null?0:hstl.hostels!.length
      });

      for(var blocks in hstl.hostels!){
        final blockData = blockRF(hostelid: hstl.id, blockid: blocks.hostelID);
        batch.set(blockData, {
          "Block" : blocks.hostel,
          "Hostel-ID": blocks.hostelID,
          "floor_count": blocks.noOfWashingMachine
        });

      }
    }
    await batch.commit();
  }
}