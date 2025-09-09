import 'package:flutter/material.dart';

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = "0";

  void _hitung(String operasi) {
    final double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    final double angka2 = double.tryParse(_angka2Controller.text) ?? 0;
    double hasilPerhitungan = 0;

    if (operasi == '+') {
      hasilPerhitungan = angka1 + angka2;
    } else if (operasi == '-') {
      hasilPerhitungan = angka1 - angka2;
    } else if (operasi == '*') {
      hasilPerhitungan = angka1 * angka2;
    } else if (operasi == '/') {
      hasilPerhitungan = angka1 / angka2;
    }

    setState(() {
      _hasil = hasilPerhitungan.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Simpel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              decoration: const InputDecoration(labelText: "Angka 1"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _angka2Controller,
              decoration: const InputDecoration(labelText: "Angka 2"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text(
              "Hasil: $_hasil",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => _hitung('+'), child: const Text("Tambah")),
            ElevatedButton(onPressed: () => _hitung('-'), child: const Text("Kurang")),
            ElevatedButton(onPressed: () => _hitung('*'), child: const Text("Kali")),
            ElevatedButton(onPressed: () => _hitung('/'), child: const Text("Bagi")),
          ],
        ),
      ),
    );
  }
}