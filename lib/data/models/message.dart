class Message {
  final String username;  // Имя пользователя, который отправил сообщение
  final String content;   // Текст сообщения
  final DateTime timestamp;  // Временная метка отправки сообщения

  Message({
    required this.username,
    required this.content,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      username: json['username'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
