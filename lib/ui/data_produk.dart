import 'package:flutter/material.dart';
// import 'package:myapp/ui/edit_data.dart';
import 'package:myapp/ui/edit_produk.dart';
import 'package:myapp/ui/produk_form.dart';
import 'data_storage.dart'; // Import file penyimpanan data

class DataProduk extends StatefulWidget {
  const DataProduk({Key? key}) : super(key: key);

  @override
  DataProdukState createState() => DataProdukState();
}

class DataProdukState extends State<DataProduk> {
  
  @override
  void initState() {
    super.initState();
  }

  void _addDataProduk(Map<String, dynamic> newData) {
    setState(() {
      DataStorage2.dataProduk.add(newData);
    });
    _showSnackBar('Data berhasil ditambahkan!');
  }

  void _updateDataProduk(int index, Map<String, dynamic> updatedData) {
    setState(() {
      DataStorage2.dataProduk[index] = updatedData;
    });
    _showSnackBar('Data berhasil diperbarui!');
  }

  void _deleteDataProduk(int index) {
    setState(() {
      DataStorage2.dataProduk.removeAt(index);
    });
    _showSnackBar('Data berhasil dihapus!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProdukForm(),
                ),
              );

              if (newData != null) {
                _addDataProduk(newData);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Kode Produk')),
            DataColumn(label: Text('Nama Produk')),
            DataColumn(label: Text('Harga Produk')),
            DataColumn(label: Text('Aksi')),
          ],
          rows: DataStorage2.dataProduk.asMap().map((index, data) {
            return MapEntry(
              index,
              DataRow(
                cells: [
                  DataCell(Text(data["kodeProduk"])),
                  DataCell(Text(data["namaProduk"])),
                  DataCell(Text(data["hargaProduk"].toString())),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final updatedData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProduk(initialData: data),
                              ),
                            );

                            if (updatedData != null) {
                              _updateDataProduk(index, updatedData);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteDataProduk(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).values.toList(),
        ),
      ),
    );
  }
}
