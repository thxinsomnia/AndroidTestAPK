import 'package:flutter/material.dart';

class EditProduk extends StatefulWidget {
  final Map<String, dynamic> initialData;

  const EditProduk({Key? key, required this.initialData}) : super(key: key);

  @override
  EditProdukState createState() => EditProdukState();
}

class EditProdukState extends State<EditProduk> {
  late TextEditingController _kodeProdukController;
  late TextEditingController _namaProdukController;
  late TextEditingController _hargaProdukController;

  @override
  void initState() {
    super.initState();
    _kodeProdukController = TextEditingController(text: widget.initialData["kodeProduk"]);
    _namaProdukController = TextEditingController(text: widget.initialData["namaProduk"]);
    _hargaProdukController = TextEditingController(text: widget.initialData["hargaProduk"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Produk'), // Mengubah label menjadi Produk
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField("Kode Produk", _kodeProdukController),
            _buildTextField("Nama Produk", _namaProdukController),
            _buildTextField("Harga Produk", _hargaProdukController, isNumber: true),
            ElevatedButton(
              onPressed: () {
                String kodeProduk = _kodeProdukController.text;
                String namaProduk = _namaProdukController.text;
                int hargaProduk = int.tryParse(_hargaProdukController.text) ?? 0;

                Navigator.of(context).pop({
                  'kodeProduk': kodeProduk,
                  'namaProduk': namaProduk,              
                  'hargaProduk': hargaProduk,    
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
    _kodeProdukController.dispose();
    _namaProdukController.dispose();
    _hargaProdukController.dispose();
    super.dispose();
  }
}
