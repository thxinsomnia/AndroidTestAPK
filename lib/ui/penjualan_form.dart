import 'package:flutter/material.dart';

class PenjualanForm extends StatefulWidget {
  const PenjualanForm({Key? key}) : super(key: key);

  @override
  PenjualanFromState createState() => PenjualanFromState();
}

class PenjualanFromState extends State<PenjualanForm> {
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
      readOnly: true, // Mencegah input manual
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          setState(() {
            _tanggalController.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
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

        // Validasi input
        if (noFaktur.isEmpty || tanggal.isEmpty || namaCustomer.isEmpty || 
            namaBarang.isEmpty || hargaBarang <= 0 || jumlahBarang <= 0) {
          // Tampilkan pesan kesalahan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Silakan lengkapi semua field dengan benar!')),
          );
          return;
        }

        double totalHarga = hargaBarang * jumlahBarang;

        // Mengembalikan data ke halaman sebelumnya
        Navigator.of(context).pop({
          'noFaktur': noFaktur,
          'tanggal': tanggal,
          'namaCustomer': namaCustomer,
          'namaBarang': namaBarang,
          'hargaBarang': hargaBarang,
          'jumlahBarang': jumlahBarang,
          'totalHarga': totalHarga,
        });

        // Reset field setelah menyimpan
        _noFakturController.clear();
        _tanggalController.clear();
        _namaCustomerController.clear();
        _namaBarangController.clear();
        _hargaBarangController.clear();
        _jumlahBarangController.clear();
      },
      child: const Text('Simpan'),
    );
  }
}
