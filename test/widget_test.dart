import 'package:flutter/material.dart';
import 'package:flutter_chat_app_test/presentation/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginScreen has a title and message input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Проверяем наличие заголовка
    expect(find.text('Login'), findsOneWidget);

    // Проверяем наличие текстового поля
    expect(find.byType(TextField), findsOneWidget);

    // Проверяем наличие кнопки
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
