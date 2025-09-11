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
    final String inputText = _angkaController.text;
    String hasilTampil = "";

    if (inputText.isEmpty) {
      setState(() {
        _hasil = "";
      });
      return;
    }

    // ngubah inputan user ke double karena textfield itu setring
    final double? angkaDouble = double.tryParse(inputText);
    // kenapa pake tryparse, karena tryparse tidak akan menghasil error msg walaupun kita input sembarang (misal titik atau koma)

    // jika tidak kosong maka
    if (angkaDouble != null) {
      // cek apakah sisa bagi dengan 1 itu enol
      if (angkaDouble % 1 == 0) {
        // kelo enol berarti kan dia int (ini kasus yang dia misal 5.0) maka ubah tipedata ke int karena sblmnya double
        final int angka = angkaDouble.toInt();

        if (angka % 2 == 0) {
          hasilTampil = "$angka adalah genap";
        } else {
          hasilTampil = "$angka adalah ganjil";
        }
      } else {
        // ini jalan ketika sisa baginya itu bukan enol (alias masih ada sisa koma)
        hasilTampil = "Masukkan bilangan bulat saja!";
      }
    }
    // ini jalan kalo parsingnya gagal (misal input karakter atau huruf)
    else {
      hasilTampil = "Masukkan bilangan bulat saja!";
    }

    setState(() {
      _hasil = hasilTampil;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Ganjil Genap"),
        backgroundColor: const Color(0xFFF784C5),
      ),
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
                _hasil,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 198, 228),
                foregroundColor: Colors.black,
              ),
              onPressed: () => _hitung(),
              child: const Text("Tentukan"),
            ),
          ],
        ),
      ),
    );
  }
}
