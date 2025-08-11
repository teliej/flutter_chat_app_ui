import 'package:flutter/material.dart';
import 'package:flutter_basics/services/mock_data_service.dart';
import '../models/chat.dart';
import '../custom_classes/message_bubble.dart';

class ChatPage extends StatefulWidget {
  final String displayName;
  final String chatId;

  const ChatPage({super.key, required this.displayName, required this.chatId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late List<Message> messages;

  @override
  void initState() {
    super.initState();
    messages = MockDataService().messagesByChatId[widget.chatId] ?? [];
  }
  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      final message = Message(
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'me', // You can change this depending on user logic
        content: text,
        type: 'text',
        timestamp: DateTime.now().millisecondsSinceEpoch,
        status: 'sent',
      );

      setState(() {
        messages.add(message);
        _messageController.clear();
      });

      // Scroll to bottom
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }


  String _formatTimestamp(int timestamp) {
    final dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();

    final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';

    // if (now.difference(dt).inDays == 0) {
    //   return "$hour:$minute $period";
    // } else {
    //   return "${dt.day}/${dt.month}/${dt.year}";
    // }

    if (now.difference(dt).inDays == 0) {
      return "$hour:$minute $period";
    } else {
      return "$hour:$minute $period";
    }
  }




  @override
  Widget build(BuildContext context) {
    bool isTyping = _messageController.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white,)
              ),
              SizedBox(width: 12),
              Text(widget.displayName),
              
            ],
          )
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            
            onSelected: (value) {
              if (value == 'Toggle Theme') {
                // Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }
            },
            itemBuilder: (BuildContext context) {
              return ['View contact','Search','New Group','Media, links and docs','Mute notification','Disappearing messages', 'Chat theme', 'More'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 🧱 Messages List
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final isMe = message.senderId == 'me';

                return MessageBubble(
                  message: message.content,
                  timestamp: _formatTimestamp(message.timestamp),
                  isMe: isMe
                );
                // return Align(

                //   alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                //     padding: const EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: isMe ? Colors.teal[200] : Colors.grey[300],
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Column(
                //       crossAxisAlignment:
                //           isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           message.content,
                //           style: const TextStyle(fontSize: 15, color: Colors.black87),
                //         ),
                //         const SizedBox(height: 4),
                //         Text(
                //           _formatTimestamp(message.timestamp),
                //           style: TextStyle(fontSize: 10, color: Colors.black54),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
            ),
          ),

          // 🧠 Typing Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            // color: Colors.grey[100],
            // color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextInput(
                    // controller: _messageController,
                    hintText: "Type a message",
                    icon: Icons.emoji_emotions_outlined,
                    rightIcons: [
                                Icon(Icons.attach_file),
                                SizedBox(width: 10,),
                                Icon(Icons.camera_alt_outlined),
                                SizedBox(width: 20,),
                                ],
                    
                    controller: _messageController,
                    onChanged: (_) => setState(() {}),
                    // decoration: const InputDecoration(
                    //   hintText: "Type a message",
                    //   border: InputBorder.none,
                    // ),
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: isTyping ? _sendMessage : null,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(
                      isTyping ? Icons.send : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



















class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final List<Widget> rightIcons;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.icon,
    this.rightIcons = const [],
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,

      style: const TextStyle(
        color: Colors.white,       // 🔤 Text color
        fontSize: 16,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: rightIcons.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: rightIcons,
              )
            : null,
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromARGB(255, 24, 23, 23),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          // borderSide: const BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          // borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
      ),
    );
  }
}