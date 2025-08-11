import 'package:flutter/material.dart';
import 'bubble_clippers.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String timestamp;
  final bool isMe;
  final bool isSeen;
  final bool isDelivered;
  final String? avatarUrl;

  const MessageBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isMe,
    this.isSeen = false,
    this.isDelivered = true,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ? Colors.teal[200] : Colors.grey[300];
    final textColor = Colors.black;
    final tailClipper = isMe ? SendBubbleClipper() : ReceiveBubbleClipper();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && avatarUrl != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(avatarUrl!),
              ),
            ),
          Flexible(
            child: ClipPath(
              clipper: tailClipper,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 4),
                constraints: const BoxConstraints(maxWidth: 280),
                color: bubbleColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        message,
                        style: TextStyle(color: textColor, fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          timestamp,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color.fromARGB(255, 82, 81, 81)),
                        ),
                        if (isMe) const SizedBox(width: 4),
                        if (isMe)
                          Icon(
                            isSeen
                                ? Icons.done_all
                                : isDelivered
                                    ? Icons.done_all
                                    : Icons.check,
                            size: 16,
                            color: isSeen ? Colors.blue : const Color.fromARGB(255, 114, 113, 113),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
