import 'UserTb.dart';

class SecurityLvlTb {
  int levelId;
  String levelDesc;
  List<UserTb> userTbs;

  SecurityLvlTb({
    required this.levelId,
    required this.levelDesc,
    required this.userTbs,
  });

  // Factory method to create SecurityLvlTb object from JSON
  factory SecurityLvlTb.fromJson(Map<String, dynamic> json) {
    return SecurityLvlTb(
      levelId: json['level_id'],
      levelDesc: json['level_desc'],
      userTbs: List<UserTb>.from(
        json['user_tbs'].map((userJson) => UserTb.fromJson(userJson)),
      ),
    );
  }
}
