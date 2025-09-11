import 'package:flutter/material.dart';
import 'package:login_app/pages/menu_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // remote untuk ngolah text??
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = "";

  // hardcode data login
  final String username = "admin";
  final String password = "user";

  void _login() {
    // pengecekan input thd data hardcode
    if (_usernameController.text.isNotEmpty) {
      if ((_usernameController.text == username) &&
          (_passwordController.text == password)) {
            // pindah ke halaman menuscreen dan hapus 1 halaman/riwayat sblmnya
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MenuScreen(user: _usernameController.text),
          ),
        );
      } else {
        setState(() {
          _message = "Login gagal. Username atau password salah.";
        });
      }
    } else {
      setState(() {
        _message = "Username atau password kosong.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Tugas 1', style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xFFF784C5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ngetengahin kayak justify content center
          mainAxisAlignment: MainAxisAlignment.center,
          // ngepanjangin uk buttonnya karena elevated button itu panjangnya sesuai dgn isi konten
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: _login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            if (_message.isNotEmpty)
              Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
