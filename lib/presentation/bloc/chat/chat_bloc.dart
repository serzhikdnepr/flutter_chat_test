import 'package:bloc/bloc.dart';

import '../../../data/models/message.dart';
import '../../../data/services/websocket_service.dart';
import '../../../domain/usecases/send_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;
  final WebSocketService webSocketService;

  ChatBloc({required this.sendMessage, required this.webSocketService}) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<MessageReceived>(_onMessageReceived);

    // Listen to WebSocket messages
    webSocketService.messagesStream.listen((message) {
      add(MessageReceived(message));
    });
  }

  void _onSendMessageEvent(SendMessageEvent event, Emitter<ChatState> emit) {
    try {
      sendMessage(event.message);
      emit(MessageSent());
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  void _onMessageReceived(MessageReceived event, Emitter<ChatState> emit) {
    emit(MessageReceivedState(message: event.message));
  }

  @override
  Future<void> close() {
    webSocketService.closeConnection();
    return super.close();
  }
}

