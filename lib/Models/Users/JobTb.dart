import 'UserTb.dart';

class JobTb {
  String jobId;
  String jobDesc;
  List<UserTb> userTbs;

  JobTb({
    required this.jobId,
    required this.jobDesc,
    required this.userTbs,
  });

  // Factory method to create JobTb object from JSON
  factory JobTb.fromJson(Map<String, dynamic> json) {
    return JobTb(
      jobId: json['job_id'],
      jobDesc: json['job_desc'],
      userTbs: List<UserTb>.from(
        json['user_tbs'].map((userJson) => UserTb.fromJson(userJson)),
      ),
    );
  }
}
