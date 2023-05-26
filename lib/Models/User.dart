// ignore_for_file: file_names

class User {
  final int id;
  final String profilePicturePath;
  final String username;

  User({
    required this.id,
    required this.profilePicturePath,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        profilePicturePath: json["profilePicturePath"],
        username: json["username"],
      );
}
