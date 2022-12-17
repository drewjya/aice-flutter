import 'dart:io';

import 'package:aice/models/form_submit_model.dart';
import 'package:aice/models/other_submit_model.dart';
import 'package:aice/models/superhyper_submit_model.dart';
import 'package:aice/net/flutterfire.dart';
import 'package:aice/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

typedef FileFunction = Function(File file);

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _kodeTokoController = TextEditingController();
  final TextEditingController _jumlahPoController = TextEditingController();
  final TextEditingController _jumlahItemTerdisplayController =
      TextEditingController();
  final TextEditingController _saranDanKendalaController =
      TextEditingController();
  final TextEditingController _produkReturController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String kualitasProduk = 'Baik';
  String pilihanToko = 'Alfamart';
  String stickerFreezer = 'Ada';
  String kategoriFreezer = 'Frezer Aice';
  String papanHarga = 'Ada';
  String labelHarga = 'Ada';
  String woblerPromo = 'Terpasang';
  String spanduk = 'Ada';
  String kepenuhanFreezerAtas = '100%';
  String debuFreezer = 'Ada Debu';
  String brandLain = 'Ada';
  String stockBrandLain = 'Ada';
  String bekasLemFreezer = 'Ada Bekas Lem';
  String posisiFreezer = 'Sudah Bagus';
  String dividerKulkas = 'Terpasang';
  String stockDibawahFreezer = 'Ada';
  String produkPromosi = 'Ada';
  String kebersihanBungaEs = 'Bersih';

  File? _pickedSelfie;
  File? _farFreezer;
  File? _closeFreezer;
  File? _openedFreezer;
  File? _freezerOne;
  File? _freezerTwo;
  File? _freezerThree;
  File? _freezerIslandOne;
  File? _freezerIslandTwo;
  File? _freezerIslandThree;
  File? _fotoPop;
  File? _fotoPeralatan;
  File? _po;
  File? _freezerBawah;
  File? _fotoSelaFreezer;

  bool _isLoading = false;

// 1. Selfie dengan depan pintu yang kelihatan kode toko dan nama toko ;
// 2. Foto freezer dari jauh ( kelihatan stiker freezer )
// 3. Foto freezer dari dekat dan jangan buka kaca freezer ( kelihatan papan harga, label harga, wobler promo )
// 4. Foto freezer dari dekat dan geser kaca freezer (kelihatan display produk)
// 5. Foto PO yang sudah ambil ke toko.

// 7. Jumlah item terdisplay : option ( 1 - 10 )
// 12. PO : option ( 1 - 10 dus )

// 14. Saran dan kendala : bebas tulis.

  void _pickImage({required FileFunction func}) async {
    final picker = ImagePicker();
    final pickedSelfie = await picker.pickImage(
      preferredCameraDevice: CameraDevice.rear,
      source: ImageSource.camera,
      maxWidth: 480,
      maxHeight: 600,
    );
    if (pickedSelfie != null) {
      func(File(pickedSelfie.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple, Colors.orangeAccent]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.pinkAccent),
            tabs: [
              Tab(icon: Icon(Icons.store)),
              Tab(icon: Icon(Icons.icecream)),
              Tab(icon: Icon(Icons.camera_alt)),
            ],
          ),
          title: const Text(
            'Tambah Sales',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Mohon masukkan nama toko";
                                }
                                return null;
                              },
                              controller: _storeNameController,
                              decoration: const InputDecoration(
                                labelText: "Nama Toko",
                                fillColor: Colors.blue,
                                focusColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Mohon masukkan kode toko";
                                }
                                return null;
                              },
                              controller: _kodeTokoController,
                              decoration: const InputDecoration(
                                labelText: "Kode Toko",
                                fillColor: Colors.blue,
                                focusColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pilihan Toko",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: pilihanToko,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      pilihanToko = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Alfamart',
                                  'Alfamidi',
                                  'Indomaret',
                                  'Superhyper'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Kualitas produk",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: kualitasProduk,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      kualitasProduk = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Baik',
                                  '1-10 Pcs Rusak ',
                                  '11-20 Pcs Rusak',
                                  'Hampir Semua Rusak',
                                  'Semua Rusak'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Sticker Freezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: stickerFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      stickerFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Papan Harga",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: papanHarga,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      papanHarga = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Divider/Sekat",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: dividerKulkas,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      dividerKulkas = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Terpasang',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Label Harga",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: labelHarga,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      labelHarga = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Wobler Promo",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: woblerPromo,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      woblerPromo = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Terpasang',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Spanduk",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: spanduk,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      spanduk = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Atribut Brand Lain Yang Mengambil Space AICE",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: brandLain,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      brandLain = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Stock Brand Lain Yang Mengambil Space AICE",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: stockBrandLain,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      stockBrandLain = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Stock Dibawah Freezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: stockDibawahFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      stockDibawahFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Produk Promosi",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: produkPromosi,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      produkPromosi = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada',
                                  'Tidak Ada',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Kebersihan Bunga Es",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: kebersihanBungaEs,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      kebersihanBungaEs = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Bersih',
                                  'Tidak',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Kepenuhan Freezer Bagian Atas",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: kepenuhanFreezerAtas,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      kepenuhanFreezerAtas = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  '100%',
                                  '70 - 90%',
                                  '50% - 70%',
                                  '30% - 50%',
                                  '10% - 30%',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Debu Freezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: debuFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      debuFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada Debu',
                                  'Tidak Ada debu',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Bekas Lem Freezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: bekasLemFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      bekasLemFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Ada Bekas Lem',
                                  'Tidak ada bekas lem',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Posisi Freezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: posisiFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      posisiFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Sudah Bagus',
                                  'Terhalang ATM',
                                  'Kondisi buruk lainnya'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Jumlah PO";
                                      }
                                      return null;
                                    },
                                    controller: _jumlahPoController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: "Jumlah PO",
                                      fillColor: Colors.blue,
                                      focusColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Jumlah Item Terdisplay";
                                      }
                                      return null;
                                    },
                                    controller: _jumlahItemTerdisplayController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: "Jumlah Item Terdisplay",
                                      fillColor: Colors.blue,
                                      focusColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Saran dan Kendala";
                                      }
                                      return null;
                                    },
                                    controller: _saranDanKendalaController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      labelText: "Saran dan Kendala",
                                      fillColor: Colors.blue,
                                      focusColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller: _produkReturController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      labelText: "Produk Retur",
                                      hintText: "Nama Produk - X pcs",
                                      fillColor: Colors.blue,
                                      focusColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Kategori Frezer",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              DropdownButton<String>(
                                value: kategoriFreezer,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      kategoriFreezer = newValue;
                                    });
                                  }
                                },
                                items: <String>[
                                  'Frezer Aice',
                                  'Sharing Frezer Brand lain',
                                  'Sharing Frezer Aice'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      if (pilihanToko == "Superhyper") ...[
                        PickerWidget(
                            title: "Foto Selfie Depan Nama Toko",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _pickedSelfie = file));
                            },
                            file: _pickedSelfie),
                        PickerWidget(
                            title: "Foto Kulkas Jauh",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _farFreezer = file));
                            },
                            file: _farFreezer),
                        PickerWidget(
                            title: "Foto Kulkas Dekat",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _closeFreezer = file));
                            },
                            file: _closeFreezer),
                        PickerWidget(
                            title: "Foto Freezer One",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerOne = file));
                            },
                            file: _freezerOne),
                        PickerWidget(
                            title: "Foto Freezer Dua",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerTwo = file));
                            },
                            file: _freezerTwo),
                        PickerWidget(
                            title: "Foto Freezer Tiga",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerThree = file));
                            },
                            file: _freezerThree),
                        PickerWidget(
                            title: "Freezer Island 1",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerIslandOne = file));
                            },
                            file: _freezerIslandOne),
                        PickerWidget(
                            title: "Freezer Island 2",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerIslandTwo = file));
                            },
                            file: _freezerIslandTwo),
                        PickerWidget(
                            title: "Freezer Island 3",
                            onTap: () {
                              _pickImage(
                                  func: (file) => setState(
                                      () => _freezerIslandThree = file));
                            },
                            file: _freezerIslandThree),
                        PickerWidget(
                            title: "Foto Freezer Bawah",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerBawah = file));
                            },
                            file: _freezerBawah),
                        PickerWidget(
                            title: "Foto PO",
                            onTap: () {
                              _pickImage(
                                  func: (file) => setState(() => _po = file));
                            },
                            file: _po),
                        PickerWidget(
                            title: "Foto Pop",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _fotoPop = file));
                            },
                            file: _fotoPop),
                        PickerWidget(
                            title: "Foto Peralatan",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _fotoPeralatan = file));
                            },
                            file: _fotoPeralatan),
                        // PickerWidget(
                        //     title: "Foto Sela Freezer",
                        //     onTap: () {
                        //       _pickImage(
                        //           func: (file) =>
                        //               setState(() => _fotoSelaFreezer = file));
                        //     },
                        //     file: _fotoSelaFreezer),
                      ] else ...[
                        PickerWidget(
                            title: "Foto Selfie Depan Pintu",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _pickedSelfie = file));
                            },
                            file: _pickedSelfie),
                        PickerWidget(
                            title: "Foto Kulkas Jauh",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _farFreezer = file));
                            },
                            file: _farFreezer),
                        PickerWidget(
                            title: "Foto Kulkas Dekat",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _closeFreezer = file));
                            },
                            file: _closeFreezer),
                        PickerWidget(
                            title: "Foto Kulkas Terbuka",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _openedFreezer = file));
                            },
                            file: _openedFreezer),
                        PickerWidget(
                            title: "Foto PO",
                            onTap: () {
                              _pickImage(
                                  func: (file) => setState(() => _po = file));
                            },
                            file: _po),
                        PickerWidget(
                            title: "Foto Freezer Bawah",
                            onTap: () {
                              _pickImage(
                                  func: (file) =>
                                      setState(() => _freezerBawah = file));
                            },
                            file: _freezerBawah),
                      ]
                    ],
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            var uuid = const Uuid();

            if (_storeNameController.text.isEmpty ||
                _kodeTokoController.text.isEmpty ||
                _jumlahPoController.text.isEmpty ||
                _jumlahItemTerdisplayController.text.isEmpty ||
                _saranDanKendalaController.text.isEmpty ||
                _produkReturController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mohon isi semua form")));
              return;
            } else if (pilihanToko == "Superhyper" &&
                (_pickedSelfie == null ||
                    _farFreezer == null ||
                    _closeFreezer == null ||
                    _freezerOne == null ||
                    _freezerTwo == null ||
                    _freezerThree == null ||
                    _freezerIslandOne == null ||
                    _freezerIslandTwo == null ||
                    _freezerIslandThree == null ||
                    _freezerBawah == null ||
                    _po == null ||
                    _fotoPop == null ||
                    _fotoPeralatan == null)) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mohon isi semua lampiran")));
              return;
            } else if (pilihanToko != "Superhyper" &&
                (_pickedSelfie == null ||
                    _farFreezer == null ||
                    _closeFreezer == null ||
                    _openedFreezer == null ||
                    _po == null ||
                    _freezerBawah == null)) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mohon isi semua lampiran")));
              return;
            } else {
              setState(() {
                _isLoading = true;
              });
              final formVal = FormSubmitModel(
                  id: uuid.v1(),
                  storeName: _storeNameController.text,
                  kodeToko: _kodeTokoController.text,
                  jumlahPo: _jumlahPoController.text,
                  jumlahItemTerdisplay: _jumlahItemTerdisplayController.text,
                  saranDanKendala: _saranDanKendalaController.text,
                  produkRetur: _produkReturController.text,
                  pilihanToko: pilihanToko,
                  kualitasProduk: kualitasProduk,
                  kategoriFreezer: kategoriFreezer,
                  stickerFreezer: stickerFreezer,
                  papanHarga: papanHarga,
                  dividerKulkas: dividerKulkas,
                  labelHarga: labelHarga,
                  woblerPromo: woblerPromo,
                  spanduk: spanduk,
                  kepenuhanFreezerAtas: kepenuhanFreezerAtas,
                  debuFreezer: debuFreezer,
                  brandLain: brandLain,
                  stockBrandLain: stockBrandLain,
                  bekasLemFreezer: bekasLemFreezer,
                  posisiFreezer: posisiFreezer,
                  stockDibawahFreezer: stockDibawahFreezer,
                  kebersihanBungaEs: kebersihanBungaEs,
                  produkPromosi: produkPromosi);
              bool add;
              if (pilihanToko == "Superhyper") {
                add = await addSuperHyperSale(
                    superhyperSubmitModel: SuperhyperSubmitModel(
                        pickedSelfie: _pickedSelfie!,
                        farFreezer: _farFreezer!,
                        closeFreezer: _closeFreezer!,
                        freezerOne: _freezerOne!,
                        freezerTwo: _freezerTwo!,
                        freezerThree: _freezerThree!,
                        freezerIslandOne: _freezerIslandOne!,
                        freezerIslandTwo: _freezerIslandTwo!,
                        freezerIslandThree: _freezerIslandThree!,
                        freezerBawah: _freezerBawah!,
                        po: _po!,
                        fotoPop: _fotoPop!,
                        fotoPeralatan: _fotoPeralatan!),
                    formSubmitModel: formVal);
              } else {
                add = await addOtherSale(
                    otherSubmitModel: OtherSubmitModel(
                        pickedSelfie: _pickedSelfie!,
                        farFreezer: _farFreezer!,
                        closeFreezer: _closeFreezer!,
                        openedFreezer: _openedFreezer!,
                        po: _po!,
                        freezerBawah: _freezerBawah!),
                    formSubmitModel: formVal);
              }

              setState(() {
                _isLoading = false;
              });
              if (add) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Upload Gagal",
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            }
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}

class PickerWidget extends StatelessWidget {
  const PickerWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.file});
  final VoidCallback? onTap;
  final File? file;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(title),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: file != null
                  ? DecorationImage(
                      image: FileImage(file!),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/camera.png'),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
