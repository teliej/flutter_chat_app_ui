import '../models/chat.dart';
import '../models/call.dart';
import '../models/community.dart';
import '../models/status.dart';
import 'mock_loader.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  List<Chat> chats = [];
  // List<Message> messages = [];
  List<Message> messages = [];
  Map<String, List<Message>> messagesByChatId = {};
  List<Call> calls = [];
  List<ContactStatus> statuses = [];
  List<Community> communities = [];

  Future<void> loadAllData() async {
    chats = await loadMockChats();
    // messages = await loadMockMessages();
    messages = await loadMockMessages(); // ✅ List<Message>
    messagesByChatId = await loadMockMessagesGrouped();

    calls = await loadMockCalls();
    statuses = await loadMockStatuses();
    communities = await loadMockCommunities();
  }
}