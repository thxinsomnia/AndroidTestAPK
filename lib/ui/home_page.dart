import 'package:flutter/material.dart';
import 'package:myapp/ui/produk_detail.dart';
import 'package:myapp/ui/data_penjualan.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Jumlah kolom
        children: [
          _buildButton(context, 'Dashboard', const DataPenjualan(), 'assets/img/dashboard.png'),
          _buildButton(context, 'Tambah Data', const ProdukDetail(), 'assets/img/tambah.png'),
          _buildButton(context, 'Update Data', const ProdukDetail(), 'assets/img/update.png'),
          _buildButton(context, 'Logout', const ProdukDetail(), 'assets/img/logout.png'),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, Widget page, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bentuk kotak
          ),
          padding: EdgeInsets.all(30), // Ukuran tombol
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 40), // Menambahkan gambar
            SizedBox(height: 8), // Jarak antara gambar dan teks
            Text(label), // Teks tombol
          ],
        ),
      ),
    );
  }
}

// Contoh halaman baru
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 1')),
      body: const Center(child: Text('Ini adalah Halaman 1')),
    );
  }
}
