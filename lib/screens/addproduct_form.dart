import 'package:flutter/material.dart';
import 'package:toko_sepakbola_jaya_abadi/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _productName = "";
  double _productPrice = 0.0;
  String _productDescription = "";
  String _productThumbnailUrl = "";
  String _productCategory = "";
  bool _isFeatured = false;
  final List<String> _categories = [
    'Bola',
    'Sepatu Bola',
    'Jersey',
    'Sarung Tangan',
    'Aksesoris',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Form Tambah Produk",
          ),
        ),
      ),
      drawer: LeftDrawer(),
      body: Form (
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding : const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    
                    hintText: "Masukkan Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _productName = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Nama Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan Harga Produk",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _productPrice = double.tryParse(value!)!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Harga Produk tidak boleh kosong!";
                    }
                    if (double.tryParse(value) == null){
                      return "Harga Produk harus berupa angka!";
                    }
                    if (double.tryParse(value)! <= 0){
                      return "Harga Produk harus lebih dari 0!";
                    }
                    return null;
                  },
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Masukkan Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _productDescription = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Deskripsi Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                )
                  
              ),
              Padding(
                padding: const EdgeInsets.all(8.0) ,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan URL Thumbnail Produk",
                    labelText: "URL Thumbnail Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _productThumbnailUrl = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "URL Thumbnail Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ), 
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: "Pilih Kategori Produk",
                    labelText: "Kategori Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                  items: _categories.map((String category){
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value){
                    setState(() {
                      _productCategory = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Kategori Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai produk unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value){
                    setState(() {
                      _isFeatured = value;
                      }
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 78, 142)
                        )
                      ),
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                          showDialog (
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Produk $_productName berhasil ditambahkan!"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Nama Produk: $_productName"),
                                      Text("Harga: $_productPrice"),
                                      Text("Deskripsi: $_productDescription"),
                                      Text("URL Thumbnail: $_productThumbnailUrl"),
                                      Text("Kategori: $_productCategory"),
                                      Text("Produk Unggulan: ${_isFeatured ? "Ya" : "Tidak"}"),

                                    ],
                                  ),
                                ), 
                                actions:[
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, 
                                    child: const Text("OK")
                                  )
                                ]
                              );        
                            }
                          );
                          _formKey.currentState!.reset();
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          color: Colors.white,)
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
      )
    );
  }






}
