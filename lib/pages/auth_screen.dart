import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/menu_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = "";

  void _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _message = "Register Berhasil";
      });
    } catch (e) {
      setState(() {
        _message = "Register Gagal $e";
      });
    }
  }

  void _login() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );

      if (userCredential.user != null && mounted) {
        // 3. Ganti halaman login dengan halaman menu
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MenuScreen(user: userCredential.user!)
          ),
        );
      }

      setState(() {
        _message = "Login Berhasil";
      });
    } catch (e) {
      setState(() {
        _message = "Login Gagal $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 1 PAM")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text("Register")),
            ElevatedButton(onPressed: _login, child: Text("Login")),
            SizedBox(height: 20),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
