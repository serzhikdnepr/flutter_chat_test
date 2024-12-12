import 'package:flutter/material.dart';
import '../../data/models/message.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          title: Text(message.username),
          subtitle: Text(message.content),
          trailing: Text(
            '${message.timestamp.hour}:${message.timestamp.minute}',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        );
      },
    );
  }
}
