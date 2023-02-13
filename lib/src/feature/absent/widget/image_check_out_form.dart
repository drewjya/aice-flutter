// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class ImageCheckOutForm extends StatelessWidget {
  const ImageCheckOutForm({
    Key? key,
    required this.fotoDisplayProdukFreezer1,
    required this.fotoDisplayProdukFreezer2,
    required this.fotoDisplayProdukFreezer3,
    required this.fotoDisplayProdukFreezerIsland1,
    required this.fotoPosisiFreezerDariJauh,
    required this.fotoPopPromosi,
  }) : super(key: key);

  final ValueNotifier<File?> fotoDisplayProdukFreezer1;
  final ValueNotifier<File?> fotoDisplayProdukFreezer2;
  final ValueNotifier<File?> fotoDisplayProdukFreezer3;
  final ValueNotifier<File?> fotoDisplayProdukFreezerIsland1;
  final ValueNotifier<File?> fotoPosisiFreezerDariJauh;
  final ValueNotifier<File?> fotoPopPromosi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.height(context),
      child: GridView(
        primary: false,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          ImageSalesPicker(
              title: "Foto Display Produk Freezer 1",
              file: fotoDisplayProdukFreezer1),
          ImageSalesPicker(
              title: "Foto Display Produk Freezer 2",
              file: fotoDisplayProdukFreezer2),
          ImageSalesPicker(
              title: "Foto Display Produk Freezer 3",
              file: fotoDisplayProdukFreezer3),
          ImageSalesPicker(
              title: "Foto Display Produk Island/TG 1",
              file: fotoDisplayProdukFreezerIsland1),
          ImageSalesPicker(
              title: "Foto Posisi Freezer Dari Jauh",
              file: fotoPosisiFreezerDariJauh),
          ImageSalesPicker(title: "Foto POP Promosi", file: fotoPopPromosi),
        ],
      ),
    );
  }
}
