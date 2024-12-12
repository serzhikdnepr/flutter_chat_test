import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/message_repository.dart'; // Импортируем MessageRepository
import 'data/services/websocket_service.dart';
import 'domain/usecases/authenticate_user.dart';
import 'domain/usecases/send_message.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/chat/chat_bloc.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/chat_screen.dart';

void main() {
  final AuthRepository authRepository = AuthRepositoryImpl('https://example.com');
  final WebSocketService webSocketService = WebSocketService('wss://echo.websocket.org');
  final MessageRepository messageRepository = MessageRepositoryImpl(webSocketService); // Создаем MessageRepository

  runApp(MyApp(
    authRepository: authRepository,
    messageRepository: messageRepository,
    webSocketService: webSocketService, // Передаем WebSocketService
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final MessageRepository messageRepository; // Добавляем MessageRepository
  final WebSocketService webSocketService; // Добавляем WebSocketService

  const MyApp({
    required this.authRepository,
    required this.messageRepository,
    required this.webSocketService, // Инициализируем WebSocketService
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authenticateUser: AuthenticateUser(authRepository),
          ),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            sendMessage: SendMessage(messageRepository), // Используем MessageRepository
            webSocketService: webSocketService, // Передаем WebSocketService
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/chat': (context) => ChatScreen(),
        },
      ),
    );
  }
}
