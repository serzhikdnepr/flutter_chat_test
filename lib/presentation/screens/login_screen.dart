import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                if (username.isNotEmpty) {
                  BlocProvider.of<AuthBloc>(context).add(LoginRequested(username: username));
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return CircularProgressIndicator();
                } else if (state is AuthError) {
                  return Text('Error: ${state.message}', style: TextStyle(color: Colors.red));
                } else if (state is Authenticated) {
                  Future.microtask(() => Navigator.of(context).pushReplacementNamed('/chat'));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
