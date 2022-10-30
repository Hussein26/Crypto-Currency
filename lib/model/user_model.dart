class UserModel {
  String userId;
  String displayName;
  String email;
  String photoURL;

  UserModel({
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      email: json['email'],
      photoURL: json['photoURL'],
      userId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'uId': userId,
    };
  }
}
