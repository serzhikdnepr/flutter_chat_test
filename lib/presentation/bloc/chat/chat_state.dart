part of 'chat_bloc.dart';


abstract class ChatState {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class MessageSent extends ChatState {}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageReceivedState extends ChatState {
  final Message message;

  const MessageReceivedState({required this.message});

  @override
  List<Object> get props => [message];
}

class ChatLoading extends ChatState {}
