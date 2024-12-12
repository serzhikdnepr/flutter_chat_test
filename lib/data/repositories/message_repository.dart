
import '../models/message.dart';
import '../services/websocket_service.dart';

abstract class MessageRepository {
  Stream<Message> getMessagesStream();
  void sendMessage(Message message);
}

class MessageRepositoryImpl implements MessageRepository {
  final WebSocketService _webSocketService;

  MessageRepositoryImpl(this._webSocketService);

  @override
  Stream<Message> getMessagesStream() {
    return _webSocketService.messagesStream;
  }

  @override
  void sendMessage(Message message) {
    _webSocketService.sendMessage(message);
  }
}
