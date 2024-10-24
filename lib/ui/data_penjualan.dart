import 'package:flutter/material.dart';
import 'package:myapp/ui/produk_form.dart';

class DataPenjualan extends StatefulWidget {
  const DataPenjualan({Key? key}) : super(key: key);

  @override
  _DataPenjualanState createState() => _DataPenjualanState();
}

class _DataPenjualanState extends State<DataPenjualan> {
  final List<Map<String, dynamic>> dataPenjualan = [
    {
      "noFaktur": "001",
      "tanggal": "2024-01-01",
      "namaCustomer": "John Doe",
      "jumlahBarang": 2,
      "totalPenjualan": 2500000,
    },
    {
      "noFaktur": "002",
      "tanggal": "2024-01-02",
      "namaCustomer": "Jane Smith",
      "jumlahBarang": 1,
      "totalPenjualan": 5000000,
    },
    {
      "noFaktur": "003",
      "tanggal": "2024-01-03",
      "namaCustomer": "Alice Johnson",
      "jumlahBarang": 1,
      "totalPenjualan": 1500000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProdukForm(),
                ),
              );
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
            DataColumn(label: Text('Jumlah Barang')),
            DataColumn(label: Text('Total Penjualan')),
          ],
          rows: dataPenjualan.map(
            (data) {
              return DataRow(
                cells: [
                  DataCell(Text(data["noFaktur"])),
                  DataCell(Text(data["tanggal"])),
                  DataCell(Text(data["namaCustomer"])),
                  DataCell(Text(data["jumlahBarang"].toString())),
                  DataCell(Text(data["totalPenjualan"].toString())),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
