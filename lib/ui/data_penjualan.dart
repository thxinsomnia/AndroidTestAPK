import 'package:flutter/material.dart';
import 'package:myapp/ui/produk_form.dart';

class DataPenjualan extends StatefulWidget {
  const DataPenjualan({Key? key}) : super(key: key);

  @override
  _DataPenjualanState createState() => _DataPenjualanState();
}

class _DataPenjualanState extends State<DataPenjualan> {
  List<Map<String, dynamic>> dataPenjualan = [
    {
      "noFaktur": "001",
      "tanggal": "2024-01-01",
      "namaCustomer": "John Doe",
      "namaBarang": "Kulkas",
      "hargaBarang": 2500000,
      "jumlahBarang": 2,
      "totalHarga": 5000000,
    },
    {
      "noFaktur": "002",
      "tanggal": "2024-01-02",
      "namaCustomer": "Jane Smith",
      "namaBarang": "Televisi",
      "hargaBarang": 5000000,
      "jumlahBarang": 1,
      "totalHarga": 5000000,
    },
    {
      "noFaktur": "003",
      "tanggal": "2024-01-03",
      "namaCustomer": "Alice Johnson",
      "namaBarang": "Mesin Cuci",
      "hargaBarang": 1500000,
      "jumlahBarang": 1,
      "totalHarga": 1500000,
    },
  ];

  void _addDataPenjualan(Map<String, dynamic> newData) {
    setState(() {
      dataPenjualan.add(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
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
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No Faktur')),
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Nama Customer')),
            DataColumn(label: Text('Nama Barang')),
            DataColumn(label: Text('Harga Barang')),
            DataColumn(label: Text('Jumlah Barang')),
            DataColumn(label: Text('Total Harga')),
          ],
          rows: dataPenjualan.map(
            (data) {
              return DataRow(
                cells: [
                  DataCell(Text(data["noFaktur"])),
                  DataCell(Text(data["tanggal"])),
                  DataCell(Text(data["namaCustomer"])),
                  DataCell(Text(data["namaBarang"])),
                  DataCell(Text(data["hargaBarang"].toString())),
                  DataCell(Text(data["jumlahBarang"].toString())),
                  DataCell(Text(data["totalHarga"].toString())),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
