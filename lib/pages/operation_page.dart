import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OperationPage extends StatefulWidget {
  const OperationPage({super.key});

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _angkaInput = "";

  // State untuk hasil hitung jumlah digit
  String _jumlahDigitHasil = "";

  // State untuk hasil penjumlahan digit
  String _penjumlahanDigitHasil = "";
  String _prosesPerhitungan = "";

  void _lakukanPerhitungan() {
    final String inputText = _angkaController.text;

    if (inputText.isNotEmpty) {
      // --- Logika untuk Menghitung Jumlah Digit ---
      int jumlahDigit = inputText.length;

      // --- Logika untuk Menjumlahkan Digit ---
      int totalPenjumlahan = 0;
      List<String> digitList = [];
      for (int i = 0; i < inputText.length; i++) {
        int digit = int.tryParse(inputText[i]) ?? 0;
        totalPenjumlahan += digit;
        digitList.add(inputText[i]);
      }

      // Update state untuk semua hasil
      setState(() {
        _angkaInput = inputText;
        _jumlahDigitHasil = "$jumlahDigit digit";
        _prosesPerhitungan = digitList.join(' + ');
        _penjumlahanDigitHasil = "$totalPenjumlahan";
      });
    } else {
      // Reset jika input kosong
      setState(() {
        _angkaInput = "";
        _jumlahDigitHasil = "";
        _penjumlahanDigitHasil = "";
        _prosesPerhitungan = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Angka")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _angkaController,
              decoration: const InputDecoration(
                labelText: "Masukkan Angka",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _lakukanPerhitungan,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 30),

            // Bagian untuk menampilkan hasil jika ada input
            if (_angkaInput.isNotEmpty)
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hasil untuk angka '$_angkaInput':",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                      // Hasil 1: Jumlah Digit
                      const Text(
                        "1. Jumlah Digit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _jumlahDigitHasil,
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 20),

                      // Hasil 2: Penjumlahan Digit
                      const Text(
                        "2. Penjumlahan Setiap Digit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _prosesPerhitungan,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      Text(
                        "= $_penjumlahanDigitHasil",
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
