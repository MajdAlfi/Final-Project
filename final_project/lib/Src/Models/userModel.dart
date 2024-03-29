// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class userModel {
  int? points; //
  String? name; //
  List? supportedProjects;
  List? yourProject;
  String? desc; //
  int? goal; //
  int? actionsCompleted; //
  String? profileIMG;
  userModel({
    this.points,
    this.name,
    this.supportedProjects,
    this.yourProject,
    this.desc,
    this.goal,
    this.actionsCompleted,
    this.profileIMG,
  });

  userModel copyWith({
    int? points,
    String? name,
    List? supportedProjects,
    List? yourProject,
    String? desc,
    int? goal,
    int? actionsCompleted,
    String? profileIMG,
  }) {
    return userModel(
      points: points ?? this.points,
      name: name ?? this.name,
      supportedProjects: supportedProjects ?? this.supportedProjects,
      yourProject: yourProject ?? this.yourProject,
      desc: desc ?? this.desc,
      goal: goal ?? this.goal,
      actionsCompleted: actionsCompleted ?? this.actionsCompleted,
      profileIMG: profileIMG ?? this.profileIMG,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'points': points,
      'name': name,
      'supportedProjects': supportedProjects,
      'yourProject': yourProject,
      'desc': desc,
      'goal': goal,
      'actionsCompleted': actionsCompleted,
      'profileIMG': profileIMG,
    };
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      points: map['points'] != null ? map['points'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      supportedProjects: map['supportedProjects'] != null
          ? List<int>.from((map['supportedProjects'] as List<int>))
          : null,
      yourProject: map['yourProject'] != null
          ? List<int>.from((map['yourProject'] as List<int>))
          : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      goal: map['goal'] != null ? map['goal'] as int : null,
      actionsCompleted: map['actionsCompleted'] != null
          ? map['actionsCompleted'] as int
          : null,
      profileIMG:
          map['profileIMG'] != null ? map['profileIMG'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) =>
      userModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'userModel(points: $points, name: $name, supportedProjects: $supportedProjects, yourProject: $yourProject, desc: $desc, goal: $goal, actionsCompleted: $actionsCompleted, profileIMG: $profileIMG)';
  }

  @override
  bool operator ==(covariant userModel other) {
    if (identical(this, other)) return true;

    return other.points == points &&
        other.name == name &&
        other.supportedProjects == supportedProjects &&
        other.yourProject == yourProject &&
        other.desc == desc &&
        other.goal == goal &&
        other.actionsCompleted == actionsCompleted &&
        other.profileIMG == profileIMG;
  }

  @override
  int get hashCode {
    return points.hashCode ^
        name.hashCode ^
        supportedProjects.hashCode ^
        yourProject.hashCode ^
        desc.hashCode ^
        goal.hashCode ^
        actionsCompleted.hashCode ^
        profileIMG.hashCode;
  }
}
