import 'AccessTb.dart';
import 'JobTb.dart';
import 'PlantTb.dart';
import 'SecurityLvlTb.dart';

class UserTb {
  int levelId;
  String jobId;
  String userId;
  String username;
  String password;
  String plantId;
  DateTime createDateTime;
  int stat;
  List<AccessTb> accessTbs;
  JobTb job;
  SecurityLvlTb level;
  PlantTb plant;

  UserTb({
    required this.levelId,
    required this.jobId,
    required this.userId,
    required this.username,
    required this.password,
    required this.plantId,
    required this.createDateTime,
    required this.stat,
    required this.accessTbs,
    required this.job,
    required this.level,
    required this.plant,
  });

  // Factory method to create UserTb object from JSON
  factory UserTb.fromJson(Map<String, dynamic> json) {
    return UserTb(
      levelId: json['level_id'],
      jobId: json['job_id'],
      userId: json['user_id'],
      username: json['username'],
      password: json['password'],
      plantId: json['plant_id'],
      createDateTime: json['create_date_time'] != null
          ? DateTime.tryParse(json['create_date_time']) ?? DateTime.now()
          : DateTime.now(),
      stat: json['stat'],
      accessTbs: List<AccessTb>.from(
        json['access_tbs'].map((accessJson) => AccessTb.fromJson(accessJson)),
      ),
      job: JobTb.fromJson(json['job']),
      level: SecurityLvlTb.fromJson(json['level']),
      plant: PlantTb.fromJson(json['plant']),
    );
  }

}
