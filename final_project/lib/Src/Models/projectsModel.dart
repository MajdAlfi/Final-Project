// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  int goal;
  String location;
  int projectId;
  int currentPoints;
  Timestamp expDate;
  String overview;
  String img;
  String title;
  String uid;
  ProjectModel({
    required this.goal,
    required this.location,
    required this.projectId,
    required this.currentPoints,
    required this.expDate,
    required this.overview,
    required this.img,
    required this.title,
    required this.uid,
  });

  ProjectModel copyWith({
    int? goal,
    String? location,
    int? projectId,
    int? currentPoints,
    Timestamp? expDate,
    String? overview,
    String? img,
    String? title,
    String? uid,
  }) {
    return ProjectModel(
      goal: goal ?? this.goal,
      location: location ?? this.location,
      projectId: projectId ?? this.projectId,
      currentPoints: currentPoints ?? this.currentPoints,
      expDate: expDate ?? this.expDate,
      overview: overview ?? this.overview,
      img: img ?? this.img,
      title: title ?? this.title,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goal': goal,
      'location': location,
      'projectId': projectId,
      'currentPoints': currentPoints,
      'expDate': expDate,
      'overview': overview,
      'img': img,
      'title': title,
      'uid': uid,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      goal: map['goal'] as int,
      location: map['location'] as String,
      projectId: map['projectId'] as int,
      currentPoints: map['currentPoints'] as int,
      expDate: map['expDate'] as Timestamp,
      overview: map['overview'] as String,
      img: map['img'] as String,
      title: map['title'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjectModel(goal: $goal, location: $location, projectId: $projectId, currentPoints: $currentPoints, expDate: $expDate, overview: $overview, img: $img, title: $title, uid: $uid)';
  }

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.goal == goal &&
        other.location == location &&
        other.projectId == projectId &&
        other.currentPoints == currentPoints &&
        other.expDate == expDate &&
        other.overview == overview &&
        other.img == img &&
        other.title == title &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return goal.hashCode ^
        location.hashCode ^
        projectId.hashCode ^
        currentPoints.hashCode ^
        expDate.hashCode ^
        overview.hashCode ^
        img.hashCode ^
        title.hashCode ^
        uid.hashCode;
  }
}
