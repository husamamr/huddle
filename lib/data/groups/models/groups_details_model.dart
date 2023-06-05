import 'dart:convert';

import '../../homeScreen/home_screen_model.dart';

class GroupsDetilsModel {
  List<UserInfos>? userInfos;
  int? requesterIsConfirmed;
  List<ActivePlaces>? activePlaces;

  GroupsDetilsModel({this.userInfos, this.requesterIsConfirmed, this.activePlaces});

  GroupsDetilsModel.fromJson(Map<String, dynamic> json) {
    if (json['userInfos'] != null) {
      userInfos = <UserInfos>[];
      json['userInfos'].forEach((v) {
        userInfos!.add( UserInfos.fromJson(v));
      });
    }
    requesterIsConfirmed = json['requesterIsConfirmed'] ?? 0;

    if (json['activePlaces'] != null) {
      activePlaces = <ActivePlaces>[];
      json['activePlaces'].forEach((v) {
        activePlaces!.add(ActivePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfos != null) {
      data['userInfos'] = this.userInfos!.map((v) => v.toJson()).toList();
    }
    data['requesterIsConfirmed'] = this.requesterIsConfirmed;
    if (this.activePlaces != null) {
      data['activePlaces'] = this.activePlaces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInfos {
  String? userId;
  String? fname;
  String? label;
  int? isConfirmed;

  UserInfos({this.userId, this.fname, this.label, this.isConfirmed});

  UserInfos.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fname = json['fname'];
    label = json['label'];
    isConfirmed = json['isConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fname'] = this.fname;
    data['label'] = this.label;
    data['isConfirmed'] = this.isConfirmed;
    return data;
  }
}

class ActivePlaces {
  PlaceDetails? placeDetails;
  int? inCount;
  int? outCount;
  Null? isIn;

  ActivePlaces({this.placeDetails,this.inCount, this.outCount, this.isIn});

  ActivePlaces.fromJson(Map<String, dynamic> json) {
    if (json['placeDetails'] != null) {
      Map<String, dynamic> placeDetailsJson = jsonDecode(json['placeDetails']);
      placeDetails = PlaceDetails.fromJson(placeDetailsJson);
    }
    inCount = json['inCount'];
    outCount = json['outCount'];
    isIn = json['isIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inCount'] = this.inCount;
    data['outCount'] = this.outCount;
    data['isIn'] = this.isIn;
    return data;
  }
}


class PlaceDetails{
  String? name;
  String? placeId;
  String? icon;

  PlaceDetails({this.name , this.placeId,this.icon});

  PlaceDetails.fromJson(Map<String,dynamic> json){
    name = json['result']['name'].toString();
    placeId = json['result']['place_id'];

    if(json['result']['photos'] !=  null) {
      String ref = json['result']['photos'][0]['photo_reference'];
      icon = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference= $ref&key=AIzaSyDCZ1dUovZcLYLZvrGIQc7XBCG8ZKxxSK4";
    } else {
      icon = json['result']['icon'];
    }
  }
}