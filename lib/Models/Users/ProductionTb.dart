import 'dart:convert';

import 'AccessTb.dart';

class ProductionTb {
  String accessId;
  String plantId;
  String codeId;
  String slocDesc;
  AccessTb? accessTb;

  ProductionTb({
    required this.accessId,
    required this.plantId,
    required this.codeId,
    required this.slocDesc,
    this.accessTb,
  });

  // Factory method to create ProductionTb object from JSON
  factory ProductionTb.fromJson(Map<String, dynamic> json) {
    return ProductionTb(
      accessId: json['access_id'],
      plantId: json['plant_id'],
      codeId: json['code_id'],
      slocDesc: json['sloc_desc'],
      accessTb: json['access_tb'] != null
          ? AccessTb.fromJson(json['access_tb'])
          : null,
    );
  }
}
