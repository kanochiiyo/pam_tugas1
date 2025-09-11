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
    // ngeganti tipe data karena textfield isinya string
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Kalkulator Simpel"),
        backgroundColor: const Color(0xFFF784C5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 251, 198, 228),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _hitung('+'),
                    child: const Text(
                      "+",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 251, 198, 228),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _hitung('-'),
                    child: const Text(
                      "-",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 251, 198, 228),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _hitung('*'),
                    child: const Text(
                      "x",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 251, 198, 228),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _hitung('/'),
                    child: const Text(
                      "/",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
