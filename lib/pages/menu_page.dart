import 'package:flutter/material.dart';
import 'package:login_app/pages/kalkutor_page.dart';
import 'package:login_app/pages/odd_even.dart';
import 'package:login_app/pages/operation_page.dart';
import 'package:login_app/pages/profil_kelompok.dart';

class MenuScreen extends StatelessWidget {
  final String user;

  const MenuScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF784C5),
        title: const Text("Menu Utama"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // pergi ke halaman /auth (authscreen) dan buang semua riwayat yang pernah dibuka
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/auth', (route) => false);  // route false untuk jangan berhenti menghapus
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat Datang!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              user,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilKelompok(),
                  ),
                );
              },
              child: const Text("Profil Kelompok"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const KalkulatorScreen(),
                  ),
                );
              },
              child: const Text("Menu Kalkulator"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // push = membuka halaman dan menumpuk di atasnya 
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GanjilGenap()),
                );
              },
              child: const Text("Menu Ganjil Genap"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OperationPage(),
                  ),
                );
              },
              child: const Text("Menu Operasi"),
            ),
          ],
        ),
      ),
    );
  }
}
