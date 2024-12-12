import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat/chat_bloc.dart';
import '../../data/models/message.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final messageContent = _controller.text;
              if (messageContent.isNotEmpty) {
                final message = Message(
                  username: 'User', // Замените на имя пользователя
                  content: messageContent,
                  timestamp: DateTime.now(),
                );
                BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(message: message));
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
