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
  String _jumlahDigitHasil = "";
  String _penjumlahanDigitHasil = "";
  String _prosesPerhitungan = "";

  void _lakukanPerhitungan() {
    final String inputText = _angkaController.text;

    if (inputText.isNotEmpty) {
      int jumlahDigit = inputText.length;
      int totalPenjumlahan = 0;
      List<String> digitList = [];
      for (int i = 0; i < inputText.length; i++) {
        int digit = int.tryParse(inputText[i]) ?? 0;
        totalPenjumlahan += digit;
        digitList.add(inputText[i]);
      }

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
      appBar: AppBar(title: const Text("Operasi Angka")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _angkaController,
              decoration: const InputDecoration(labelText: "Masukkan Angka"),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _lakukanPerhitungan,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),

            // Garis pemisah antara input dan hasil
            if (_angkaInput.isNotEmpty) const Divider(thickness: 1),

            const SizedBox(height: 20), 

            // Bagian untuk menampilkan hasil jika ada input
            if (_angkaInput.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hasil untuk '$_angkaInput':",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Hasil 1: Jumlah Digit
                  Text(
                    "Jumlah Digit: $_jumlahDigitHasil",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  // Hasil 2: Penjumlahan Digit
                  Text(
                    "Penjumlahan Digit: $_prosesPerhitungan = $_penjumlahanDigitHasil",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
