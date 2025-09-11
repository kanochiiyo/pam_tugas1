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
    final String cleanedInput = inputText
        .replaceAll('.', '')
        .replaceAll(',', '');

    //jika inputnya tdk kosong maka jalankan if
    if (cleanedInput.isNotEmpty) {
      // menghitung panjang digit dgn cara cari tau lengthnya
      int jumlahDigit = cleanedInput.length;
      // set total ke 0 dulu
      int totalPenjumlahan = 0;
      // bikin list atau array buat nampung list angkanya
      List<String> digitList = [];
      // perulangan yg jalan untuk mengubah tipe data ke int dan menghitung jumlahnya berapa
      for (int i = 0; i < cleanedInput.length; i++) {
        // ngubah tipe data tiap digit
        int digit = int.tryParse(cleanedInput[i]) ?? 0;
        // jumlahkan satu per satu
        totalPenjumlahan += digit;
        // masukkan tiap karakter yg diinput ke dalam array digitlist
        digitList.add(cleanedInput[i]);
      }

      setState(() {
        _angkaInput = cleanedInput;
        _jumlahDigitHasil = "$jumlahDigit digit";
        // menampilkan tiap isi array ditambah " + "
        // misal isi arraynya [3,4,5] maka 3 + 4 + 5
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Operasi Angka"),
        backgroundColor: const Color(0xFFF784C5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _angkaController,
              decoration: const InputDecoration(labelText: "Masukkan Angka"),
              keyboardType: TextInputType.number,
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
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
