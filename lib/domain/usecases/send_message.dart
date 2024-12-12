import '../../data/models/message.dart';
import '../../data/repositories/message_repository.dart';

class SendMessage {
  final MessageRepository messageRepository;

  SendMessage(this.messageRepository);

  void call(Message message) {
    messageRepository.sendMessage(message);
  }
}
