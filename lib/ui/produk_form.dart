import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _noFakturController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _namaCustomerController = TextEditingController();
  final _namaBarangController = TextEditingController();
  final _hargaBarangController = TextEditingController();
  final _jumlahBarangController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Penjualan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxNoFaktur(),
            _textboxTanggal(),
            _textboxNamaCustomer(),
            _textboxNamaBarang(),
            _textboxHargaBarang(),
            _textboxJumlahBarang(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _textboxNoFaktur() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Faktur Penjualan"),
      controller: _noFakturController,
    );
  }

  Widget _textboxTanggal() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Penjualan"),
      controller: _tanggalController,
      keyboardType: TextInputType.datetime,
    );
  }

  Widget _textboxNamaCustomer() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Customer"),
      controller: _namaCustomerController,
    );
  }

  Widget _textboxNamaBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Barang"),
      controller: _namaBarangController,
    );
  }

  Widget _textboxHargaBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga Barang"),
      controller: _hargaBarangController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _textboxJumlahBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah Barang"),
      controller: _jumlahBarangController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String noFaktur = _noFakturController.text;
        String tanggal = _tanggalController.text;
        String namaCustomer = _namaCustomerController.text;
        String namaBarang = _namaBarangController.text;
        double hargaBarang = double.tryParse(_hargaBarangController.text) ?? 0.0;
        int jumlahBarang = int.tryParse(_jumlahBarangController.text) ?? 0;
        double totalHarga = hargaBarang * jumlahBarang;

        // Mengembalikan data ke halaman sebelumnya
        Navigator.of(context).pop({
          'noFaktur': noFaktur,
          'tanggal': tanggal,
          'namaCustomer': namaCustomer,
          'namaBarang': namaBarang,
          'hargaBarang': hargaBarang,
          'jumlahBarang': jumlahBarang,
          'totalHarga': totalHarga, // Memastikan totalHarga tetap ada
        });
      },
      child: const Text('Simpan'),
    );
  }
}
