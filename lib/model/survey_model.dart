
class SurveyModel {
  int id;
  int userId;
  int feelings;
  String doing;
  String about;
  String were;
  String withs;
  String emotions;
  String createdAt;
  String updatedAt;

  SurveyModel({
    required this.id,
    required this.userId,
    required this.feelings,
    required this.doing,
    required this.about,
    required this.were,
    required this.withs,
    required this.emotions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      feelings: json['feelings'] ?? 0,
      doing: json['doing'] ?? '',
      about: json['about'] ?? '',
      were: json['were'] ?? '',
      withs: json['withs'] ?? '',
      emotions: json['emotions'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'feelings': feelings,
      'doing': doing,
      'about': about,
      'were': were,
      'withs': withs,
      'emotions': emotions,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }


}
