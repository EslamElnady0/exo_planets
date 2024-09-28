class UserModel {
  final String name;
  final String email;
  final String uid;
  int points;
  String? imageUrl;

  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      this.imageUrl,
      this.points = 0});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      uid: json['uid'],
      email: json['email'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'imageUrl': imageUrl,
    };
  }
}
