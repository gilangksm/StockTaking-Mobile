import 'ProductionTb.dart';
import 'UserTb.dart';
import 'WarehouseTb.dart';

class AccessTb {
  String userId;
  String accessId;
  String plantId;
  String codeId;
  ProductionTb access;
  WarehouseTb accessNavigation;
  UserTb user;

  AccessTb({
    required this.userId,
    required this.accessId,
    required this.plantId,
    required this.codeId,
    required this.access,
    required this.accessNavigation,
    required this.user,
  });

  // Factory method to create AccessTb object from JSON
  factory AccessTb.fromJson(Map<String, dynamic> json) {
    return AccessTb(
      userId: json['user_id'],
      accessId: json['access_id'],
      plantId: json['plant_id'],
      codeId: json['code_id'],
      access: ProductionTb.fromJson(json['access']),
      accessNavigation: WarehouseTb.fromJson(json['access_navigation']),
      user: UserTb.fromJson(json['user']),
    );
  }
}
