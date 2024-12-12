part of 'chat_bloc.dart';


abstract class ChatEvent {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final Message message;

  const SendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageReceived extends ChatEvent {
  final Message message;

  const MessageReceived(this.message);

  @override
  List<Object> get props => [message];
}
