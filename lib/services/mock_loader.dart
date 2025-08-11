import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/chat.dart';
import '../models/status.dart';
import '../models/community.dart';
import '../models/call.dart';

Future<Map<String, dynamic>> _loadJson() async {
  final jsonStr = await rootBundle.loadString('assets/mock_data.json');
  return jsonDecode(jsonStr);
}

Future<List<Chat>> loadMockChats() async {
  final json = await _loadJson();
  return (json['chats'] as List).map((e) => Chat.fromJson(e)).toList();
}

// Future<List<Message>> loadMockMessages() async {
//   final json = await _loadJson();
//   return (json['messages'] as List).map((e) => Message.fromJson(e)).toList();
// }

Future<List<Message>> loadMockMessages() async {
  final json = await _loadJson();
  final messagesMap = json['messages'] as Map<String, dynamic>;

  final allMessages = messagesMap.values
      .expand((chatMessages) => (chatMessages as List)
          .map((e) => Message.fromJson(e)))
      .toList();

  return allMessages;
}


Future<Map<String, List<Message>>> loadMockMessagesGrouped() async {
  final json = await _loadJson();
  final messagesMap = json['messages'] as Map<String, dynamic>;

  return messagesMap.map((chatId, messagesJsonList) {
    final messages = (messagesJsonList as List)
        .map((e) => Message.fromJson(e))
        .toList();
    return MapEntry(chatId, messages);
  });
}



Future<List<Call>> loadMockCalls() async {
  final json = await _loadJson();
  return (json['calls'] as List).map((e) => Call.fromJson(e)).toList();
}

Future<List<ContactStatus>> loadMockStatuses() async {
  final json = await _loadJson();
  return (json['statuses'] as List).map((e) => ContactStatus.fromJson(e)).toList();
}

Future<List<Community>> loadMockCommunities() async {
  final json = await _loadJson();
  return (json['communities'] as List).map((e) => Community.fromJson(e)).toList();
}
