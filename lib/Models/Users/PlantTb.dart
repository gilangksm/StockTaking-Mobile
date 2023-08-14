import 'dart:convert';

import 'UserTb.dart';

class PlantTb {
  String plantId;
  String plantDesc;
  List<UserTb> userTbs;

  PlantTb({
    required this.plantId,
    required this.plantDesc,
    required this.userTbs,
  });

  // Factory method to create PlantTb object from JSON
  factory PlantTb.fromJson(Map<String, dynamic> json) {
    return PlantTb(
      plantId: json['plant_id'],
      plantDesc: json['plant_desc'],
      userTbs: List<UserTb>.from(
        json['user_tbs'].map((userJson) => UserTb.fromJson(userJson)),
      ),
    );
  }
}
