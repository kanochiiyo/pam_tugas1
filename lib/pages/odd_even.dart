import 'package:flutter/material.dart';

class GanjilGenap extends StatefulWidget {
  const GanjilGenap({super.key});

  @override
  State<GanjilGenap> createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasil = "";

  void _hitung() {
    final int angka = int.tryParse(_angkaController.text) ?? 0;
    String hasil = "";

    if (angka % 2 == 0) {
      hasil = "genap";
    } else {
      hasil = "ganjil";
    }

    setState(() {
      _hasil = hasil;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ganjil Genap")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _angkaController,
              decoration: const InputDecoration(labelText: "Angka"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            if (_hasil.isNotEmpty)
              Text(
                "${_angkaController.text} adalah $_hasil",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _hitung(),
              child: const Text("Tentukan"),
            ),
          ],
        ),
      ),
    );
  }
}
