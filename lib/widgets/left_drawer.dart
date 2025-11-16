import 'package:flutter/material.dart';
import 'package:toko_sepakbola_jaya_abadi/screens/addproduct_form.dart';
import 'package:toko_sepakbola_jaya_abadi/screens/menu.dart';
import 'package:toko_sepakbola_jaya_abadi/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Toko Sepakbola Jaya Abadi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  child: 
                  Text(
                    "Seluruh produk sepakbola berkualitas ada disini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
                
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add),
            title: Text('Add Product'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormPage(),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Product List'),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}
