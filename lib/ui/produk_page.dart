import 'package:flutter/material.dart';
import 'package:myapp/ui/produk_form.dart';
import 'data_storage.dart'; // Import DataStorage2

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
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
      body: ListView.builder(
        itemCount: DataStorage2.dataProduk.length,
        itemBuilder: (context, index) {
          final produk = DataStorage2.dataProduk[index];
          return Card(
            child: ListTile(
              title: Text(produk['namaProduk'] ?? 'Unknown'),
              subtitle: Text(produk['hargaProduk']?.toString() ?? '0'),
              onTap: () {
                _showProdukDetail(context, produk);
              },
            ),
          );
        },
      ),
    );
  }

  void _showProdukDetail(BuildContext context, Map<String, dynamic> produk) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(produk['namaProduk'] ?? 'Unknown'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Kode Produk: ${produk['kodeProduk'] ?? 'N/A'}"),
              Text("Nama Produk: ${produk['namaProduk'] ?? 'N/A'}"),
              Text("Harga Produk: Rp${produk['hargaProduk'] ?? '0'}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
