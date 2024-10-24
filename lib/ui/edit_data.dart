import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  final Map<String, dynamic> initialData;

  const EditData({Key? key, required this.initialData}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController _noFakturController;
  late TextEditingController _tanggalController;
  late TextEditingController _namaCustomerController;
  late TextEditingController _namaBarangController;
  late TextEditingController _hargaBarangController;
  late TextEditingController _jumlahBarangController;

  @override
  void initState() {
    super.initState();
    _noFakturController = TextEditingController(text: widget.initialData["noFaktur"]);
    _tanggalController = TextEditingController(text: widget.initialData["tanggal"]);
    _namaCustomerController = TextEditingController(text: widget.initialData["namaCustomer"]);
    _namaBarangController = TextEditingController(text: widget.initialData["namaBarang"]);
    _hargaBarangController = TextEditingController(text: widget.initialData["hargaBarang"].toString());
    _jumlahBarangController = TextEditingController(text: widget.initialData["jumlahBarang"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Penjualan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField("No Faktur Penjualan", _noFakturController),
            _buildTextField("Tanggal Penjualan", _tanggalController),
            _buildTextField("Nama Customer", _namaCustomerController),
            _buildTextField("Nama Barang", _namaBarangController),
            _buildTextField("Harga Barang", _hargaBarangController, isNumber: true),
            _buildTextField("Jumlah Barang", _jumlahBarangController, isNumber: true),
            ElevatedButton(
              onPressed: () {
                String noFaktur = _noFakturController.text;
                String tanggal = _tanggalController.text;
                String namaCustomer = _namaCustomerController.text;
                String namaBarang = _namaBarangController.text;
                double hargaBarang = double.tryParse(_hargaBarangController.text) ?? 0.0;
                int jumlahBarang = int.tryParse(_jumlahBarangController.text) ?? 0;
                double totalHarga = hargaBarang * jumlahBarang;

                Navigator.of(context).pop({
                  'noFaktur': noFaktur,
                  'tanggal': tanggal,
                  'namaCustomer': namaCustomer,
                  'namaBarang': namaBarang,
                  'hargaBarang': hargaBarang,
                  'jumlahBarang': jumlahBarang,
                  'totalHarga': totalHarga,
                });
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }

  @override
  void dispose() {
    _noFakturController.dispose();
    _tanggalController.dispose();
    _namaCustomerController.dispose();
    _namaBarangController.dispose();
    _hargaBarangController.dispose();
    _jumlahBarangController.dispose();
    super.dispose();
  }
}
