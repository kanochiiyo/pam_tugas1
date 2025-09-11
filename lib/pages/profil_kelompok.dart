import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ProfilKelompok extends StatelessWidget {
  const ProfilKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Menu Utama"),
        backgroundColor: const Color(0xFFF784C5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Anggota Kelompok:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "1. Zeva Mila Sabrina (124230043)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "2. Najwa Egi Fitriyani (124230058)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "3. Andini Andaresta (124230084)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "4. Rake Putri Cahyani (124230107)",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
