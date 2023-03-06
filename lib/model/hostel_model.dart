class HostelModel {
  List<Hostels>? hostels;
  String? id;

  HostelModel({this.hostels,this.id});

  HostelModel.fromJson(Map<String, dynamic> json) {
    hostels = (json['Hostels'] as List).map((dynamic e) => Hostels.fromJson(e as Map<String, dynamic>)).toList();
    id = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ID'] = id;
    if (hostels != null) {
      data['Hostels'] = hostels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hostels {
  String? hostelID;
  int? noOfWashingMachine;
  String? hostel;
  List<Floors>? floors;

  Hostels({this.hostelID, this.noOfWashingMachine, this.hostel, this.floors});

  Hostels.fromJson(Map<String, dynamic> json) {
    hostelID = json['Hostel-ID']  ;
    noOfWashingMachine = json['No.of Washing machine'];
    hostel = json['Hostel']  ;
    floors = (json['Floors'] as List).map((e) => Floors.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Hostel-ID'] = hostelID;
    data['No.of Washing machine'] = noOfWashingMachine;
    data['Hostel'] = hostel;
    if (floors != null) {
      data['Floors'] = floors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  String? floor1;
  String? floor2;
  String? floor3;
  String? floor4;
  String? floor5;
  String? floor6;
  String? floor7;
  String? floor8;
  String? floor9;
  String? floor10;
  String? floor11;
  String? floor12;
  String? floor21;
  String? floor22;
  String? floor31;
  String? floor32;
  String? floor41;
  String? floor42;
  String? floor51;
  String? floor52;
  String? floor61;
  String? floor62;

  Floors(
      {this.floor1,
      this.floor2,
      this.floor3,
      this.floor4,
      this.floor5,
      this.floor6,
      this.floor7,
      this.floor8,
      this.floor9,
      this.floor10,
      this.floor11,
      this.floor12,
      this.floor21,
      this.floor22,
      this.floor31,
      this.floor32,
      this.floor41,
      this.floor42,
      this.floor51,
      this.floor52,
      this.floor61,
      this.floor62});

  Floors.fromJson(Map<String, dynamic> json) {
    floor1 = json['Floor-1']  ;
    floor2 = json['Floor-2']  ;
    floor3 = json['Floor-3']  ;
    floor4 = json['Floor-4']  ;
    floor5 = json['Floor-5']  ;
    floor6 = json['Floor-6']  ;
    floor7 = json['Floor-7']  ;
    floor8 = json['Floor-8']  ;
    floor9 = json['Floor-9']  ;
    floor10 = json['Floor-10']  ;
    floor11 = json['Floor-1-1']  ;
    floor12 = json['Floor-1-2']  ;
    floor21 = json['Floor-2-1']  ;
    floor22 = json['Floor-2-2']  ;
    floor31 = json['Floor-3-1']  ;
    floor32 = json['Floor-3-2']  ;
    floor41 = json['Floor-4-1']  ;
    floor42 = json['Floor-4-2']  ;
    floor51 = json['Floor-5-1']  ;
    floor52 = json['Floor-5-2']  ;
    floor61 = json['Floor-6-1']  ;
    floor62 = json['Floor-6-2']  ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Floor-1'] = floor1;
    data['Floor-2'] = floor2;
    data['Floor-3'] = floor3;
    data['Floor-4'] = floor4;
    data['Floor-5'] = floor5;
    data['Floor-6'] = floor6;
    data['Floor-7'] = floor7;
    data['Floor-8'] = floor8;
    data['Floor-9'] = floor9;
    data['Floor-10'] = floor10;
    data['Floor-1-1'] = floor11;
    data['Floor-1-2'] = floor12;
    data['Floor-2-1'] = floor21;
    data['Floor-2-2'] = floor22;
    data['Floor-3-1'] = floor31;
    data['Floor-3-2'] = floor32;
    data['Floor-4-1'] = floor41;
    data['Floor-4-2'] = floor42;
    data['Floor-5-1'] = floor51;
    data['Floor-5-2'] = floor52;
    data['Floor-6-1'] = floor61;
    data['Floor-6-2'] = floor62;
    return data;
  }
}