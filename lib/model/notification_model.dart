
class NotificationModel {
  int id;
  int userId;
  int time;
  String title;

  String createdAt;
  String updatedAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.time,
    required this.title,

    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      time: json['time'] ?? 0,
      title: json['title'] ?? '',

      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'time': time,
      'title': title,

      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }


}
