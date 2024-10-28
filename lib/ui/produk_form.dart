
import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHargaProduk(),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxKodeProduk() {
    return TextField(decoration: const InputDecoration(labelText: "Kode Produk"));
  }

  _textboxNamaProduk() {
    return TextField(decoration: const InputDecoration(labelText: "Nama Produk"));
  }

  _textboxHargaProduk() {
    return TextField(decoration: const InputDecoration(labelText: "Harga"));
  }

  _tombolSimpan() {
    return ElevatedButton(onPressed: () {}, child: const Text('Simpan'));
  }
}
