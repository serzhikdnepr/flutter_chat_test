import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat/chat_bloc.dart';
import '../widgets/message_input.dart';
import '../widgets/message_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatInitial) {
                  return Center(child: Text('Start chatting!'));
                } else if (state is ChatLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ChatError) {
                  return Center(child: Text('Error: ${state.message}', style: TextStyle(color: Colors.red)));
                } else if (state is MessageReceivedState) {
                  return MessageList(messages: [state.message]); // Используем MessageList для отображения сообщений
                }
                return Container();
              },
            ),
          ),
          MessageInput(), // Используем MessageInput для ввода сообщений
        ],
      ),
    );
  }
}
