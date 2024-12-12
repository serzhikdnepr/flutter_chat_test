import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/message.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url));

  // Метод для отправки сообщения
  void sendMessage(Message message) {
    final jsonMessage = json.encode(message.toJson());
    _channel.sink.add(jsonMessage);
  }

  // Метод для получения потока сообщений
  Stream<Message> get messagesStream {
    return _channel.stream.map((data) {
      final jsonData = json.decode(data);
      return Message.fromJson(jsonData);
    });
  }

  // Метод для закрытия соединения
  void closeConnection() {
    _channel.sink.close(status.goingAway);
  }
}
