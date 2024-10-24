import 'package:flutter/material.dart';
import 'package:myapp/ui/produk_form.dart';

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
                        builder: (context) => const ProdukForm()));
              })
        ],
      ),
      body: ListView(
        children: const [
          //list 1
          Card(
            child: ListTile(
              title: Text('Kulkas'),
              subtitle: Text('2500000'),
            ),
          ),
          //list 2
          Card(
            child: ListTile(
              title: Text('Televisi'),
              subtitle: Text('5000000'),
            ),
          ),
          //list 3
          Card(
            child: ListTile(
              title: Text('Mesin Cuci'),
              subtitle: Text('1500000'),
            ),
          ),
        ],
      ),
    );
  }
}
