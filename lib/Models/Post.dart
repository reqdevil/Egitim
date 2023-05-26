// ignore_for_file: file_names

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'package:egitim/Models/User.dart';
import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  final int id;
  final String thumbnailPath;
  final DateTime created;
  final int viewCount;
  final int duration;
  final String title;
  final User user;

  Post({
    required this.id,
    required this.thumbnailPath,
    required this.created,
    required this.viewCount,
    required this.duration,
    required this.title,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        thumbnailPath: json["thumbnailPath"],
        created: DateTime.parse(json["created"]),
        viewCount: json["viewCount"],
        duration: json["duration"],
        title: json["title"],
        user: User.fromJson(json["user"]),
      );
}
