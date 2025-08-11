
class Group {
  final String groupId;
  final String name;
  final int membersCount;

  Group({
    required this.groupId,
    required this.name,
    required this.membersCount,
  });


  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupId: json['groupId'],
        name: json['name'],
        membersCount: json['membersCount'],
      );

  Map<String, dynamic> toJson() => {
        'groupId': groupId,
        'name': name,
        'membersCount': membersCount,
  };
}

class Community {
  final String communityId;
  final String name;
  final String description;
  final String announcementGroupId;
  final List<Group> subGroups;
  final List<String> members;

  Community({
    required this.communityId,
    required this.name,
    required this.description,
    required this.announcementGroupId,
    required this.subGroups,
    required this.members,
  });


  factory Community.fromJson(Map<String, dynamic> json) {
    var groups = (json['subGroups'] as List)
        .map((e) => Group.fromJson(e))
        .toList();

    return Community(
      communityId: json['communityId'],
      name: json['name'],
      description: json['description'],
      announcementGroupId: json['announcementGroupId'],
      subGroups: groups,
      members: List<String>.from(json['members']),
    );
  }

  Map<String, dynamic> toJson() => {
        'communityId': communityId,
        'name': name,
        'description': description,
        'announcementGroupId': announcementGroupId,
        'subGroups': subGroups.map((e) => e.toJson()).toList(),
        'members': members,
  };
}
