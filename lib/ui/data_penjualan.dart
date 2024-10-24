import 'package:flutter/material.dart';
import 'package:myapp/ui/edit_data.dart';
import 'package:myapp/ui/produk_form.dart';
import 'data_storage.dart'; // Import file penyimpanan data

class DataPenjualan extends StatefulWidget {
  const DataPenjualan({Key? key}) : super(key: key);

  @override
  _DataPenjualanState createState() => _DataPenjualanState();
}

class _DataPenjualanState extends State<DataPenjualan> {
  
  @override
  void initState() {
    super.initState();
  }

  void _addDataPenjualan(Map<String, dynamic> newData) {
    setState(() {
      DataStorage.dataPenjualan.add(newData);
    });
    _showSnackBar('Data berhasil ditambahkan!');
  }

  void _updateDataPenjualan(int index, Map<String, dynamic> updatedData) {
    setState(() {
      DataStorage.dataPenjualan[index] = updatedData;
    });
    _showSnackBar('Data berhasil diperbarui!');
  }

  void _deleteDataPenjualan(int index) {
    setState(() {
      DataStorage.dataPenjualan.removeAt(index);
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
        title: const Text('Data Penjualan'),
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
                _addDataPenjualan(newData);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No Faktur')),
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Nama Customer')),
            DataColumn(label: Text('Nama Barang')),
            DataColumn(label: Text('Harga Barang')),
            DataColumn(label: Text('Jumlah Barang')),
            DataColumn(label: Text('Total Harga')),
            DataColumn(label: Text('Aksi')),
          ],
          rows: DataStorage.dataPenjualan.asMap().map((index, data) {
            return MapEntry(
              index,
              DataRow(
                cells: [
                  DataCell(Text(data["noFaktur"])),
                  DataCell(Text(data["tanggal"])),
                  DataCell(Text(data["namaCustomer"])),
                  DataCell(Text(data["namaBarang"])),
                  DataCell(Text(data["hargaBarang"].toString())),
                  DataCell(Text(data["jumlahBarang"].toString())),
                  DataCell(Text(data["totalHarga"].toString())),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final updatedData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditData(initialData: data),
                              ),
                            );

                            if (updatedData != null) {
                              _updateDataPenjualan(index, updatedData);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteDataPenjualan(index);
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
