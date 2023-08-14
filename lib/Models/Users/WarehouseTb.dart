import 'dart:convert';

import 'AccessTb.dart';

class WarehouseTb {
  String accessId;
  String plantId;
  String codeId;
  String plannerDesc;
  AccessTb? accessTb;

  WarehouseTb({
    required this.accessId,
    required this.plantId,
    required this.codeId,
    required this.plannerDesc,
    this.accessTb,
  });

  // Factory method to create WarehouseTb object from JSON
  factory WarehouseTb.fromJson(Map<String, dynamic> json) {
    return WarehouseTb(
      accessId: json['access_id'],
      plantId: json['plant_id'],
      codeId: json['code_id'],
      plannerDesc: json['planner_desc'],
      accessTb: json['access_tb'] != null
          ? AccessTb.fromJson(json['access_tb'])
          : null,
    );
  }
}
