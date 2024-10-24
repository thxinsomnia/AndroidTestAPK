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
  final _totalHargaController = TextEditingController();

  List<Map<String, dynamic>> penjualanList = []; // Menyimpan data penjualan

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
            _textboxTotalHarga(),
            _tombolSimpan(),
            _daftarPenjualan(), // Menampilkan daftar penjualan
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

  Widget _textboxTotalHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Total Harga"),
      controller: _totalHargaController,
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
        int hargaBarang = int.tryParse(_hargaBarangController.text) ?? 0;
        int jumlahBarang = int.tryParse(_jumlahBarangController.text) ?? 0;
        double totalHarga = double.tryParse(_totalHargaController.text) ?? 0.0;

        // Menyimpan data ke dalam list
        setState(() {
          penjualanList.add({
            'noFaktur': noFaktur,
            'tanggal': tanggal,
            'namaCustomer': namaCustomer,
            'namaBarang': namaBarang,
            'hargaBarang': hargaBarang,
            'jumlahBarang': jumlahBarang,
            'totalHarga': totalHarga,
          });

          // Mengosongkan field setelah menyimpan
          _noFakturController.clear();
          _tanggalController.clear();
          _namaCustomerController.clear();
          _namaBarangController.clear();
          _hargaBarangController.clear();
          _jumlahBarangController.clear();
          _totalHargaController.clear();
        });
      },
      child: const Text('Simpan'),
    );
  }

  Widget _daftarPenjualan() {
    return ListView.builder(
      shrinkWrap: true, // Menghindari overflow
      physics: NeverScrollableScrollPhysics(), // Menonaktifkan scroll
      itemCount: penjualanList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('No Faktur: ${penjualanList[index]['noFaktur']}'),
            subtitle: Text(
              'Tanggal: ${penjualanList[index]['tanggal']}, Customer: ${penjualanList[index]['namaCustomer']}, Barang: ${penjualanList[index]['namaBarang']} '
              'Harga: ${penjualanList[index]['hargaBarang']},Jumlah: ${penjualanList[index]['jumlahBarang']}, Total: ${penjualanList[index]['totalHarga']}',
            ),
          ),
        );
      },
    );
  }
}
