// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/models/image_form_super_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesDetail extends StatelessWidget {
  const SalesDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;
  final String empty = "Kosong";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Sales Detail',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('forms')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection('form')
                  .doc(id)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                ImageFormSuperModel? image;
                if (snapshot.data != null &&
                    snapshot.data?["Pilihan Toko"] == "Superhyper") {
                  final data = snapshot.data!.data()!;
                  image = ImageFormSuperModel.fromMap(data);
                  print(image);
                }
                return Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?["Nama Toko"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                      Text(
                          "Tanggal ${DateFormat('dd-MM-yyyy').format(snapshot.data?["Created At"].toDate())}"),
                      Text("Kode Toko: " + snapshot.data?["Kode Toko"]),
                      Text("Jumlah PO: " + snapshot.data?["Jumlah PO"]),
                      Text("Pilihan Toko: " + snapshot.data?["Pilihan Toko"]),
                      Text("Divider Kulkas: " +
                          snapshot.data?["Divider Kulkas"]),
                      Text("Jumlah Item Terdisplay: " +
                          snapshot.data?["Jumlah Item Terdisplay"]),
                      Text("Kualitas Produk: " +
                          snapshot.data?["Kualitas Produk"]),
                      Text("Sticker Freezer: " +
                          snapshot.data?["Sticker Freezer"]),
                      Text("Papan Harga: " + snapshot.data?["Papan Harga"]),
                      Text("Label Harga: " + snapshot.data?["Label Harga"]),
                      Text("Wobler Promo: " + snapshot.data?["Wobler Promo"]),
                      Text("Spanduk: " + snapshot.data?["Spanduk"]),
                      Text("Kepenuhan Freezer Atas: " +
                          snapshot.data?["Kepenuhan Freezer Atas"]),
                      Text("Kebersihan Debu Freezer: " +
                          snapshot.data?["Kebersihan Debu Freezer"]),
                      Text("Atribut Brand Lain: " +
                          snapshot.data?["Brand Lain"]),
                      Text("Stok Brand Lain: " +
                          snapshot.data?["Stock Brand Lain"]),
                      Text("Produk Retur: " + snapshot.data?["Produk Retur"]),
                      Text("Saran dan Kendala: " +
                          snapshot.data?["Saran dan Kendala"]),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              if (snapshot.data?["Pilihan Toko"] ==
                                  "Superhyper") ...[
                                CardSalesDetails(
                                    title: "Foto Selfie Nama Toko",
                                    url: image!.pickedSelfie),
                                CardSalesDetails(
                                    title: "Foto Kulkas Dari Jauh",
                                    url: image.farFreezer),
                                CardSalesDetails(
                                    title: "Foto Kulkas Dari Dekat",
                                    url: image.closeFreezer),
                                CardSalesDetails(
                                    title: "Foto Kulkas Satu",
                                    url: image.freezerOne),
                                CardSalesDetails(
                                    title: "Foto Kulkas Dua",
                                    url: image.freezerTwo),
                                CardSalesDetails(
                                    title: "Foto Kulkas Tiga",
                                    url: image.freezerThree),
                                CardSalesDetails(
                                    title: "Foto Kulkas Island Satu",
                                    url: image.freezerIslandOne),
                                CardSalesDetails(
                                    title: "Foto Kulkas Island Dua",
                                    url: image.freezerIslandTwo),
                                CardSalesDetails(
                                    title: "Foto Kulkas Island Tiga",
                                    url: image.freezerIslandThree),
                                CardSalesDetails(
                                    title: "Foto Kulkas Bawah", url: image.po),
                                CardSalesDetails(
                                    title: "Foto PO", url: image.po),
                                CardSalesDetails(
                                    title: "Foto Peralatan",
                                    url: image.fotoPop),
                                CardSalesDetails(
                                    title: "Foto POP",
                                    url: image.fotoPeralatan),
                              ] else ...[
                                CardSalesDetails(
                                    title: "Foto Selfie",
                                    url: snapshot.data?["Foto Selfie"]),
                                Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data?["Foto Kulkas Dari Jauh"]),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      const Text(
                                        'Foto Kulkas Dari Jauh',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data?["Foto Kulkas Terbuka"]),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      const Text(
                                        'Foto Kulkas Terbuka',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data?["Foto Kulkas Tertutup"]),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      const Text(
                                        'Foto Kulkas Tertutup',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data?["Foto PO"]),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      const Text(
                                        'Foto PO',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data?["Foto Freezer Bawah"]),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      const Text(
                                        'Foto Freezer Bawah',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ]),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class CardSalesDetails extends StatelessWidget {
  final String title;
  final String url;
  const CardSalesDetails({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            )),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.5)),
          )
        ],
      ),
    );
  }
}
