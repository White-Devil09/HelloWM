class HostelModel {
  String? iD;
  List<Hostels>? hostels;

  HostelModel({this.iD, this.hostels});

  HostelModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    hostels = (json['Hostels'] as List)
        .map((dynamic e) => Hostels.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    if (hostels != null) {
      data['Hostels'] = hostels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hostels {
  String? hostelID;
  String? hostel;
  List<Floors>? floors;

  Hostels({this.hostelID, this.hostel, this.floors});

  Hostels.fromJson(Map<String, dynamic> json) {
    hostelID = json['Hostel-ID'];
    hostel = json['Hostel'];
    floors = (json['Floors'] as List).map((e) => Floors.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Hostel-ID'] = hostelID;
    data['Hostel'] = hostel;
    if (floors != null) {
      data['Floors'] = floors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  String? floor;
  bool? busyStatus;
  String? block;
  bool? workingStatus;
  String? name;
  String? userId;
  String? roomNo;
  String? phoneNo;

  Floors({this.floor, this.busyStatus});

  Floors.fromJson(Map<String, dynamic> json) {
    floor = json['Floor'];
    busyStatus = json['Busy Status'];
    block = json['Block'];
    workingStatus = json['Working Status'];
    name = json['Name'];
    userId = json['UserID'];
    roomNo = json['Room no.'];
    phoneNo = json['Phone no.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Floor'] = floor;
    data['Busy Status'] = busyStatus;
    data['Block'] = block;
    data['Working Status'] = workingStatus;
    data['Name'] = name;
    data['UserId'] = userId;
    data['Room no.'] = roomNo;
    data['Phone no.'] = phoneNo;
    return data;
  }
}
