class InfluencerModel {
  int id=0;
  String name="";
  String description="";
  String email="";
  String about="";
  String education="";
  String createdAt="";
  String updatedAt="";
  int authId=0;
  String message="";
  String imageUrl="";

  InfluencerModel.empty();

  InfluencerModel(
      {required this.id,
        required this.name,
        required this.description,
        required this.email,
        required this.about,
        required this.education,
        required this.createdAt,
        required this.updatedAt,
        required this.authId,});

  InfluencerModel.fromJson(Map<String, dynamic> json ) {

    id = json['id']??0;
    name = json['name']??'';
    description = json['description']??'';
    email = json['email']??'';
    about = json['about']??'';
    education = json['education']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    authId = json['auth_id']??0;
    imageUrl = json['image']??'';
  }

  @override
  String toString() {
    return 'Data{id: $id, name: $name, description: $description, email: $email, about: $about, education: $education, createdAt: $createdAt, updatedAt: $updatedAt, authId: $authId , message"$message , imageUrl:$imageUrl}';
  }
}