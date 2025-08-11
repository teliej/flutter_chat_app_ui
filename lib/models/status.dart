
class StatusUpdate {
  final String statusId;
  final String mediaType; // 'image', 'video', 'text'
  final String contentUrl;
  final String caption;
  final int timestamp;
  final bool viewed;

  StatusUpdate({
    required this.statusId,
    required this.mediaType,
    required this.contentUrl,
    required this.caption,
    required this.timestamp,
    required this.viewed,
  });


  factory StatusUpdate.fromJson(Map<String, dynamic> json) => StatusUpdate(
        statusId: json['statusId'],
        mediaType: json['mediaType'],
        contentUrl: json['contentUrl'],
        caption: json['caption'],
        timestamp: json['timestamp'],
        viewed: json['viewed'],
      );

  Map<String, dynamic> toJson() => {
        'statusId': statusId,
        'mediaType': mediaType,
        'contentUrl': contentUrl,
        'caption': caption,
        'timestamp': timestamp,
        'viewed': viewed,
  };
}

class ContactStatus {
  final String userId;
  final String displayName;
  final String profileImage;
  final List<StatusUpdate> statusUpdates;

  ContactStatus({
    required this.userId,
    required this.displayName,
    required this.profileImage,
    required this.statusUpdates,
  });




  factory ContactStatus.fromJson(Map<String, dynamic> json) {
    var updates = (json['statusUpdates'] as List)
        .map((e) => StatusUpdate.fromJson(e))
        .toList();

    return ContactStatus(
      userId: json['userId'],
      displayName: json['displayName'],
      profileImage: json['profileImage'],
      statusUpdates: updates,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'displayName': displayName,
        'profileImage': profileImage,
        'statusUpdates': statusUpdates.map((e) => e.toJson()).toList(),
  };
}
