import 'package:flutter/material.dart';
import 'package:login_app/pages/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Login App',
      initialRoute: '/auth',
      routes: {'/auth': (context) => const AuthScreen()},
    ),
  );
}
