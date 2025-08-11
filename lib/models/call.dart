
class Call {
  final String callId;
  final String callerId;
  final String receiverId;
  final bool isGroupCall;
  final String callType; // 'voice' or 'video'
  final int timestamp;
  final int duration; // in seconds
  final String direction; // 'incoming', 'outgoing', 'missed'
  final String status; // 'answered', 'missed', 'rejected'
  final List<String>? participants; // only for group calls

  Call({
    required this.callId,
    required this.callerId,
    required this.receiverId,
    required this.isGroupCall,
    required this.callType,
    required this.timestamp,
    required this.duration,
    required this.direction,
    required this.status,
    this.participants,
  });



  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      callId: json['callId'],
      callerId: json['callerId'],
      receiverId: json['receiverId'],
      isGroupCall: json['isGroupCall'],
      callType: json['callType'],
      timestamp: json['timestamp'],
      duration: json['duration'],
      direction: json['direction'],
      status: json['status'],
      participants: json['participants'] != null
          ? List<String>.from(json['participants'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'callId': callId,
        'callerId': callerId,
        'receiverId': receiverId,
        'isGroupCall': isGroupCall,
        'callType': callType,
        'timestamp': timestamp,
        'duration': duration,
        'direction': direction,
        'status': status,
        'participants': participants,
  };

    /// Converts duration to MM:SS format
  String get formattedDuration {
    final mins = duration ~/ 60;
    final secs = duration % 60;
    return "${mins}m ${secs}s";
  }
}
